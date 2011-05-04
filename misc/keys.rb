#!/usr/bin/env ruby

require 'rubygems'
require 'mongo'
require 'json'

conn = Mongo::Connection.new

db = conn['test']
coll = db['events']

e = coll.find_one()

def traverse(e, path, prefix)
  e.each do |k,v|
    if v.respond_to?('each')
      puts "#{prefix}<li data='hideCheckbox: true'>#{k}"
      puts "#{prefix}  <ul>"
      traverse(v, path+[k], prefix+"    ")
      puts "#{prefix}  </ul>"
      puts "#{prefix}</li>"
    else
      puts "#{prefix}<li id='#{(path+[k]).compact.join('|')}'>#{k}</li>" if v.is_a?(Numeric)
    end
  end
end

puts "<ul id='treeData'>"
traverse(e,[],"  ")
puts "</ul>"
