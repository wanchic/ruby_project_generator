require 'ruby_project'

def rand_name
  c = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
  (1..((rand*25)+1)).map{|| c[rand * c.size]}.join
end

describe RubyProject do
  context 'Initialization' do
    it 'should store the project_name' do
      p_name = rand_name
      rp = RubyProject.new(p_name)

      expect(rp.project_name).to eq(p_name)
    end
  end
end