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
      context 'a .ruby-version file' do
        before do
          @filepath = @rp_dir + '/.ruby-version'
        end

        it 'should create .ruby-version file' do
          @rp.create_rvm_files
          expect(File).to exist(@filepath)
        end

        it 'should contain the ruby version' do
          @buffer = StringIO.new()
          allow(File).to receive(:open).with(@filepath, 'w').and_yield(@buffer)

          @rp.create_rvm_files
          expect(@buffer.string).to eq('ruby-2.5.3')
        end

      end
      
    end

  end
end