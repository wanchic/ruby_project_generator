require 'ruby_project'

describe RubyProject do
  context 'Initialization' do
    it 'should store the project_name' do
      p_name = rand_name
      rp = RubyProject.new(p_name)

      expect(rp.project_name).to eq(p_name)
    end
  end
end