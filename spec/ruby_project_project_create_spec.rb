require 'active_support/core_ext/kernel/reporting'
require 'ruby_project'

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
      before do
        RubyProject.any_instance.stub(:create_dir_tree)
        RubyProject.any_instance.stub(:generate_rvm_files)

        @rp = RubyProject.new
        @rp.create_project
      end

      it ':create_dir_tree' do
        expect(@rp).to have_received(:create_dir_tree)
      end

      it ':generate_rvm_files' do
        expect(@rp).to have_received(:generate_rvm_files)
      end

    end

  end

  context 'creating rvm files' do
    context 'should call method:' do
      before do
        RubyProject.any_instance.stub(:generate_erb_template)

        @rp = RubyProject.new
        @rp.generate_rvm_files
      end

      it ':generate_erb_template' do
        expect(@rp).to have_received(:generate_erb_template).at_least(:once)
      end

    end

  end

end