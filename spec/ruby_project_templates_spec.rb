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

  end

end