require 'ruby_project'

def test_erb_generation(template, new_file)
  @filepath = @rp_dir + "/#{new_file}"

  @buffer = StringIO.new()
  allow(File).to receive(:open).with(@filepath, 'w').and_yield(@buffer)

  @rp.generate_erb_template template, new_file
end

describe RubyProject do
  before do
    @rp = RubyProject.new
    @rp_dir = File.expand_path(File.join(['..','..', @rp.project_name]), __dir__ )
  end

  context 'generating from a template' do

    it 'should generate a .ruby-version file' do
      test_erb_generation 'ruby-version.erb', '.ruby-version'
      expect(@buffer.string).to eq('ruby-2.5.3')
    end

    it 'should generate a .ruby-gemset file' do
      test_erb_generation 'ruby-gemset.erb', '.ruby-gemset'
      expect(@buffer.string).to eq(@rp.project_name)
    end

    context 'should generate a Gemfile' do
      before do
        test_erb_generation 'Gemfile.erb', 'Gemfile'
      end

      it 'should include rubygems source' do
        expect(@buffer.string).to include("source 'https://rubygems.org'")
      end

      it 'should include rspec' do
        expect(@buffer.string).to include("gem 'rspec'")
      end

      it 'should include simplecov' do
        expect(@buffer.string).to include("gem 'simplecov'")
      end

      it 'should include activerecord' do
        expect(@buffer.string).to include("gem 'activerecord'")
      end

      it 'should include rvm reference to ruby version' do
        expect(@buffer.string).to include('#ruby=ruby-')
      end

      it 'should include rvm reference to ruby gemset' do
        expect(@buffer.string).to include("#ruby-gemset=#{@rp.project_name}")
      end

    end

    context 'should generate a main exec' do
      before do
        test_erb_generation 'main_exec.erb', "#{@rp.project_name}.rb"
      end

      it 'should include bash env command' do
        expect(@buffer.string).to include('#!/usr/bin/env ruby')
      end

      it 'should include lib in the load path' do
        expect(@buffer.string).to include("$LOAD_PATH << File.expand_path(File.join(['..', 'lib']), __dir__ )")
      end

      it 'should require rubygems' do
        expect(@buffer.string).to include("require 'rubygems'")
      end

      it 'should include a require loop on lib' do
        expect(@buffer.string).to include("Dir[File.expand_path(File.join(['..', 'lib','*.rb']), __dir__ )].sort.each{|f| require f}")
      end

    end

    context 'should generate a CmdArguments module' do
      before do
        test_erb_generation 'cmd_arguments.erb', "lib/cmd_arguments.rb"
      end

      it 'should be a module' do
        expect(@buffer.string).to include('module CmdArguments')
      end

    end


  end

end