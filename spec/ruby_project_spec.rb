require 'active_support/core_ext/kernel/reporting'
require 'ruby_project'

describe RubyProject do
  context 'Initialization:' do
    context 'when the project_name is specified' do
      it 'should store the project_name' do
        p_name = rand_name
        rp = RubyProject.new(p_name)

        expect(rp.project_name).to eq(p_name)
      end
    end

    context 'when the project_name is NOT specified' do
      it 'should store the default name of \'new_app\'' do
        rp = RubyProject.new
        expect(rp.project_name).to eq('new_app')
      end
    end

  end

  context 'method:' do
    before do
      @rp = RubyProject.new
    end

    context 'creating project' do
      before do
        RubyProject.any_instance.stub(:create_dir_tree)

        @rp = RubyProject.new
        @rp.create_project
      end

      it 'should display a message "Creating Project"' do
        output = capture(:stdout) do
          @rp.create_project
        end

        expect(output).to include "Creating #{@rp.project_name} project."
      end

      it 'should call :create_dir_tree' do
        expect(@rp).to have_received(:create_dir_tree)
      end

    end

    context 'creating directory tree' do
      it 'should create parent directory' do
        @rp.create_dir_tree
        rp_dir = File.expand_path(File.join(['..','..', @rp.project_name]), __dir__ )
        expect(File).to exist(rp_dir)
        expect(File).to be_directory(rp_dir)
      end
    end
  end
end