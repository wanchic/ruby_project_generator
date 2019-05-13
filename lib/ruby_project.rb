require 'fileutils'

class RubyProject
  attr_reader :project_name

  def initialize(project_name = 'new_app')
    @project_name = project_name
  end

  def create_project
    puts "Creating #{@project_name} project."
    create_dir_tree
  end

  def create_dir_tree
    puts File.expand_path(File.join(['..','..', @project_name]), __dir__ )
    FileUtils.mkdir_p File.expand_path(File.join(['..','..', @project_name]), __dir__ )
  end
end
