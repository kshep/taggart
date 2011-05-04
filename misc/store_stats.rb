#!/usr/bin/env ruby

require 'rubygems'
require 'mongo'

@conn = Mongo::Connection.new
@db   = @conn['test']
@coll = @db['foo']
@log_coll = @db['events']

#@coll.find.each { |doc| puts doc.inspect }

stats = @db.stats()
stats[:created_at] = Time.now.to_s
@log_coll.insert(stats)

server_status = @db.command('serverStatus' => 1)
server_status[:created_at] = Time.now.to_s
@log_coll.insert(server_status)
