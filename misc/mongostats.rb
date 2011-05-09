#!/usr/bin/env ruby

require 'rubygems'
require 'net/http'
require 'mongo'
require 'json'
require 'uri'

conn = Mongo::Connection.new

db_names = conn.database_names

server_status = conn[db_names[0]].command('serverStatus' => 1)

db_stats = {}

db_names.each do |db_name|
  db_stats[db_name] = conn[db_name].stats()
end

report = { 'time'          => Time.now,
           'server_status' => server_status,
           'db_stats'      => db_stats
         }.to_json

uri = URI.parse("http://taggart.dev/events")
http = Net::HTTP.new(uri.host, uri.port)
req  = Net::HTTP::Post.new(uri.request_uri)
req['Content-Type'] = 'application/json'
req.body = report

res = http.request(req)
