require 'fileutils'
require 'erb'

class RubyProject
  attr_reader :project_name

  def initialize(project_name = 'new_app')
    @project_name = project_name
    @root_path = File.expand_path(File.join(['..','..', @project_name]), __dir__ )
    @templates_path = File.expand_path(File.join(['..','templates']), __dir__ )
  end

  def create_project
    puts "Creating #{@project_name} project."
    create_dir_tree
  end

  def create_dir_tree
    FileUtils.mkdir_p @root_path
  end

  def create_rvm_files
    [['ruby-version.erb', '.ruby-version']].each do |f|

      template = File.read(@templates_path + "/#{f[0]}")
      erb_file = ERB.new(template)

      File.open(@root_path + "/#{f[1]}", "w") do |wf|
        wf.write erb_file.result
      end

    end
  end
end
