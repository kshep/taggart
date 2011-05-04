#!/usr/bin/env ruby

require 'rubygems'
require 'mongo'
require 'json'

key = ARGV[0]
puts key

conn = Mongo::Connection.new

db = conn['test']
coll = db['events']

data = "["
coll.find.each do |e|
  js_time = e['created_at'].to_i*1000
  val = key.split('|').inject(e) { |obj,item| obj[item.to_s] || break}

  data << "[#{js_time}, #{val}],"
  puts "[#{js_time}, #{val}],"
end
data << "]"

#puts data
