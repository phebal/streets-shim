#!/usr/bin/env ruby

require 'sinatra'
require "json"

get '/api/v1/segments/availability' do
  sw_lat = 0.0 
  sw_lng = 0.0 
  ne_lat = 0.0 
  ne_lng = 0.0 
  begin
    sw_lat = params['lat_min'].to_f.round(8)
    sw_lng = params['lon_min'].to_f.round(8)
    ne_lat = params['lat_max'].to_f.round(8)
    ne_lng = params['lon_max'].to_f.round(8)
  rescue
  end

  content_type :json
  {
    bounds: {
      sw: {
        lat: sw_lat,
        lng: sw_lng,
      }, ne: {
        lat: ne_lat,
        lng: ne_lng,
      }
    }, segments: []
  }.to_json
end

configure do
  set :port, ENV['DR_PORT'] || 9999
  set :bind, '0.0.0.0'
  set :show_exceptions, :after_handler
end
