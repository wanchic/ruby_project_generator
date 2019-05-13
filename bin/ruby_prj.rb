#!/usr/bin/env ruby

$LOAD_PATH << File.expand_path(File.join('..', 'lib'), __dir__ )

require 'rubygems'
require 'erb'
require 'cmd_arguments'

p_name = CmdArguments.program_name ARGV

unless p_name.nil?
  puts "Creating #{p_name} project."
end
