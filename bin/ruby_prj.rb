#!/usr/bin/env ruby

$LOAD_PATH << File.expand_path(File.join(['..', 'lib']), __dir__ )

require 'rubygems'


Dir[File.expand_path(File.join(['..', 'lib','*.rb']), __dir__ )].sort.each{|f| require f}

p_name = CmdArguments.program_name ARGV

unless p_name.nil?
  rp = RubyProject.new p_name
  rp.create_project
end
