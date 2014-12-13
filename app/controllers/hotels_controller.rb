class HotelsController < ApplicationController
  require 'net/http'
  require 'active_support/core_ext'
  require 'open-uri'
  def rakuten_web_search
    res = W2JPoint(params[:latitude], params[:longitude])
    puts res[0].round(2).to_s
    puts res[1].round(2).to_s
    url_str = "https://app.rakuten.co.jp/services/api/Travel/SimpleHotelSearch/20131024?"
    url_str += "applicationId=" + ENV["APPID"]
    url_str += "&affiliateId=" + ENV["AFID"]
    url_str += "&format=xml"
    url_str += "&latitude=" + res[0].round(2).to_s
    url_str += "&longitude=" + res[1].round(2).to_s
    url_str += "&searchRadius=2"
    url = URI.parse(url_str)
    req = Net::HTTP::Get.new(url.to_s)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    res = http.start {|http|
      http.request(req)
    }
    hash = Hash.from_xml res.body
    render :json => hash.to_json
  end
  def J2GPoint lat, lng
    
  end
  def W2JPoint lat, lng
    res = []
    _lat = lat.to_f * 3600
    _lng = lng.to_f * 3600
    res.push _lat + _lat * 0.00010696 - _lng * 0.000017467 - 0.0046020
    res.push _lng + _lat * 0.000046047 + _lng * 0.000083049 - 0.010041
    return res
  end



end
