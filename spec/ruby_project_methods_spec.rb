require 'ruby_project'

describe RubyProject do
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