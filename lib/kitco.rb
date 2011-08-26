require 'httparty'
require 'base64'
require 'time'

class Kitco
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
  
  def self.gold 
    request :gold
  end
  
  def self.silver
    request :silver
  end
  
  def self.palladium
    request :palladium
  end 
  
  def self.rhodium
    request :rhodium
  end
  
  class << self
    def request symbol
      get '/RequestHandler', :query => {:requestName => 'getSymbolSnapshot', :Symbol => symbol.upcase }
    end
    
    protected :request
  end
end
