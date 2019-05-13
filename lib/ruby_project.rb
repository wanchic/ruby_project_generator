class RubyProject
  attr_reader :project_name

  def initialize(project_name = 'new_app')
    @project_name = project_name
  end

end
