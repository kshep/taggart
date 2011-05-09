#!/usr/bin/env ruby

require 'rubygems'
require 'faker'
require 'benchmark'
require 'json'
require 'mongo'

n = ARGV[0].to_i || 100

class Data  
  def self.create!(object)
    collection.insert(object)
  end

  private
    def self.establish_connection
      Mongo::Connection.new.db("text")
    end

    def self.db
      @db ||= establish_connection
    end

    def self.collection
      @collection ||= db.collection("text")
    end
end

record = {}

Benchmark.bm do |rep|
  rep.report("generating #{ n } names") do
    n.times do
      record = { :name => Faker::Name.name,
                 :email => Faker::Internet.email,
                 :text => Faker::Company.bs,
               }
      puts record
      Data.create!(record)
    end
  end
end
