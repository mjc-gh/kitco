require 'httparty'
require 'base64'
require 'time'

class Kitco
  SYMBOLS = %w[gold silver palladium platinum rhodium].freeze

  include HTTParty

  base_uri "charts.kitco.com/KitcoCharts"
  parser lambda { |body, format|
    # they don't send an XML content-type if its a bad request
    return Crack::XML.parse(body) if body.include?('xml')

    results = {}
    data = Base64.decode64(body).split(',')

    results[:time] = Time.parse data.shift
    results[:percentage] = data.pop.to_f / 100.0

    data.collect! { |n| n.to_f }
    results.merge! Hash[ [:bid, :ask, :change, :low, :high].zip(data) ]
  }

  SYMBOLS.each do |symbol|
    class_eval <<-RUBY_EVAL
      def self.#{symbol}
        request :#{symbol}
      end
    RUBY_EVAL
  end

  class << self
    def request symbol
      get '/RequestHandler', :query => {:requestName => 'getSymbolSnapshot', :Symbol => symbol.to_s.upcase }
    end

    protected :request
  end
end
