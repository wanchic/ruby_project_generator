require 'active_support/core_ext/kernel/reporting'
require 'ruby_project'

shared_examples 'a generate_erb_template' do |call_method|
  it ':generate_erb_template' do
    RubyProject.any_instance.stub(:generate_erb_template)
    @rp = RubyProject.new

    @rp.send(call_method)
    expect(@rp).to have_received(:generate_erb_template).at_least(:once)
  end
end

describe RubyProject do
  context 'creating project' do
    it 'should display a message "Creating Project"' do
      output = capture(:stdout) do
        @rp = RubyProject.new
        @rp.create_project
      end

      expect(output).to include "Creating #{@rp.project_name} project."
    end

    context 'should call method:' do
      c_methods = [:create_dir_tree, :generate_rvm_files, :process_gemfile,
                   :process_main_exec, :process_command_arguments,
                   :setup_rspec_testing, :setup_git_and_commit]

      before do
        c_methods.each { |c_method| RubyProject.any_instance.stub(c_method) }

        @rp = RubyProject.new
        @rp.create_project
      end

      c_methods.each do |c_method|
        it ":#{c_method}" do
          expect(@rp).to have_received(c_method)
        end
      end

    end

  end

  context 'creating rvm files' do
    it_behaves_like 'a generate_erb_template', 'generate_rvm_files'
  end

  context 'generating Gemfile' do
    it_behaves_like 'a generate_erb_template', 'process_gemfile'
  end

  context 'generating main exec' do
    it_behaves_like 'a generate_erb_template', 'process_main_exec'
  end

  context 'generating lib command arguments' do
    it_behaves_like 'a generate_erb_template', 'process_command_arguments'
  end

  context 'generating rspec testing and coverage' do
    it_behaves_like 'a generate_erb_template', 'setup_rspec_testing'
  end

  context 'generating git file' do
    it_behaves_like 'a generate_erb_template', 'setup_gitignore'
  end

end