#!/usr/bin/env ruby

$LOAD_PATH << File.expand_path(File.join(['..', 'lib']), __dir__ )

require 'rubygems'
require 'erb'

Dir[File.expand_path(File.join(['..', 'lib','*.rb']), __dir__ )].sort.each{|f| require f}

p_name = CmdArguments.program_name ARGV

unless p_name.nil?
  puts "Creating #{p_name} project."
  rp = RubyProject.new p_name
  rp.create_dir_tree
end
