# Kitco Gem
[![Flattr this git repo](http://api.flattr.com/button/flattr-badge-large.png)](https://flattr.com/submit/auto?user_id=mikeycgto&url=https://github.com/mikeycgto/kitco&title=kitco&language=english&tags=github&category=software)


This gem retrieves data (via HTTParty) from Kitco Charts about Gold and other precious metals.

Use at your own discretion 

## Install

    gem install kitco


## Examples

    require 'kitco'

    puts Kitco.gold
    puts Kitco.silver

## Command Line Utility


    kitco gold

For more details on run

    kitco --help
