# nuclear reactor simulator


#this is run file just for development now

require 'bundler/setup'
Bundler.setup(:production, :development)
require "paint" 
require "solargraph"

require_relative "../libs/InputParser.rb"

InputParser.new("../examples/devinput.txt")