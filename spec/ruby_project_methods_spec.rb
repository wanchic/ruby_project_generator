require 'ruby_project'

describe RubyProject do
  context 'method:' do
    before do
      @rp = RubyProject.new
      @rp_dir = File.expand_path(File.join(['..','..', @rp.project_name]), __dir__ )
    end

    context 'creating directory tree' do
      it 'should create parent directory' do
        @rp.create_dir_tree
        expect(File).to exist(@rp_dir)
        expect(File).to be_directory(@rp_dir)
      end
    end

    context 'setting up rvm settings' do
      ['.ruby-version', '.ruby-gemset'].each do |f|
        it "should create #{f} file" do
          @filepath = @rp_dir + "/#{f}"
          @rp.generate_rvm_files
          expect(File).to exist(@filepath)
        end
      end

    end

  end
end