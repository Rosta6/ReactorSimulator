# nuclear reactor simulator


#this is run file just for development now

require 'bundler/setup'
require "paint" 

require_relative "../libs/InputParser.rb"

InputParser.new("../examples/devinput.txt")