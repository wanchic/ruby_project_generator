#!/usr/bin/env ruby

$LOAD_PATH << File.expand_path(File.join('..', 'lib'), __dir__ )

require 'rubygems'
require 'cmd_arguments'


puts CmdArguments.program_name ['mind_mem']
