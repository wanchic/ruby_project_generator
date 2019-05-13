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

        @rp = RubyProject.new
        @rp.create_project
      end

      it ':create_dir_tree' do
        expect(@rp).to have_received(:create_dir_tree)
      end
    end

  end

end