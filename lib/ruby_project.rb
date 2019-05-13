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
    generate_rvm_files
    process_gemfile
  end

  def create_dir_tree
    FileUtils.mkdir_p @root_path
  end

  def generate_rvm_files
    generate_erb_template'ruby-version.erb', '.ruby-version'
    generate_erb_template'ruby-gemset.erb', '.ruby-gemset'
  end

  def process_gemfile
    generate_erb_template'Gemfile.erb', 'Gemfile'

    Bundler.with_clean_env do
      Dir.chdir @root_path do
        `bundle install`
      end
    end
  end

  def process_main_exec

  end

  def generate_erb_template(template_name, new_filename)
    template = File.read(@templates_path + "/#{template_name}")
    erb_file = ERB.new(template)

    File.open(@root_path + "/#{new_filename}", "w") do |wf|
      wf.write erb_file.result(binding)
    end
  end
end
