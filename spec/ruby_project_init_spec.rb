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

end