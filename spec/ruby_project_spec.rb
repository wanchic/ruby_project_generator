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