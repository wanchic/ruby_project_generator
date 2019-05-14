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

    context 'setting up Gemfile' do
      ['Gemfile', 'Gemfile.lock'].each do |f|
        it "should create #{f} file" do
          @filepath = @rp_dir + "/#{f}"
          @rp.process_gemfile
          expect(File).to exist(@filepath)
        end
      end

    end

    context 'setting up main exec file' do

      before do
        @filename = "#{@rp.project_name}.rb"
        @rp.process_main_exec
      end

      it 'should create a bin directory' do
        @filepath = "#{@rp_dir}/bin"
        expect(File).to exist(@filepath)
        expect(File).to be_directory(@filepath)
      end

      it "should create main exec file as the 'project_name'.rb in the 'bin' folder" do
        @filepath = "#{@rp_dir}/bin/#{@filename}"
        expect(File).to exist(@filepath)
      end

    end

    context 'setting up command arguments' do
      before do
        @rp.process_command_arguments
      end

      it 'should create a lib directory' do
        @filepath = "#{@rp_dir}/lib"
        expect(File).to exist(@filepath)
        expect(File).to be_directory(@filepath)
      end

      it "should create cmd_arguments.rb file in the 'lib' folder" do
        @filepath = "#{@rp_dir}/lib/cmd_arguments.rb"
        expect(File).to exist(@filepath)
      end

    end

    context 'setting up rspec & simplecov' do
      before do
        @rp.setup_rspec_testing
      end

      it 'should create a spec directory' do
        @filepath = "#{@rp_dir}/spec"
        expect(File).to exist(@filepath)
        expect(File).to be_directory(@filepath)
      end

      it "should create .rspec file" do
        @filepath = "#{@rp_dir}/.rspec"
        expect(File).to exist(@filepath)
      end

      it "should create spec_helper.rb file in the 'spec' folder" do
        @filepath = "#{@rp_dir}/spec/spec_helper.rb"
        expect(File).to exist(@filepath)
      end

    end

  end
end