#!/usr/bin/env ruby

#if ARGV.first == ARGV.last
#  puts 'usage: ruby tweetstore.rb twitterusername twitterpassword'
#  break
#end

require 'rubygems'
require 'uri'
require 'mongo'
require 'yajl/http_stream'

class Twitter
  MAX_ALLOWED_ERRORS = 1200

  def self.sample_stream(username, password, &block)
    url = URI.parse("http://#{username}:#{password}@stream.twitter.com/1/statuses/sample.json")
    consecutive_errors = 0
    while consecutive_errors < MAX_ALLOWED_ERRORS do
      begin
        Yajl::HttpStream.get(url, :symbolize_keys => true) do |status|
          consecutive_errors = 0
          yield(status)
        end
      rescue Yajl::HttpStream::InvalidContentType
        consecutive_errors += 1
      end
      sleep(0.25*consecutive_errors)
    end
  end
end

class Tweet  
  def self.create!(tweets)
    collection.insert(tweets)
  end

  private
    def self.establish_connection
      Mongo::Connection.new.db("twitter")
    end

    def self.db
      @db ||= establish_connection
    end

    def self.collection
      @collection ||= db.collection("tweets")
    end
end

Twitter.sample_stream(ARGV.first, ARGV.last) do |status|
  Tweet.create!(status)
  #puts !status[:user].nil? ? "#{status[:user][:screen_name]} : '#{status[:text]}'" : "-"
end
