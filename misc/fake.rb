#!/usr/bin/env ruby

require 'rubygems'
require 'faker'
require 'benchmark'
require 'lorem'

# N = 100_000
#
#  Benchmark.bm do |rep|
#    rep.report("generating #{ N } names") do
#      N.times do
#        puts Faker::Name.name
#      end
#    end
#  end
