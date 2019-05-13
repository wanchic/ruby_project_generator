require 'active_support/core_ext/kernel/reporting'
require 'ruby_project'

describe RubyProject do
  context 'creating project' do
    it 'should display a message "Creating Project"' do
      output = capture(:stdout) do
        @rp = RubyProject.new
        @rp.create_project
      end

      expect(output).to include "Creating #{@rp.project_name} project."
    end

    context 'should call method:' do
      c_methods = [:create_dir_tree, :generate_rvm_files, :process_gemfile,
                   :process_main_exec]

      before do
        c_methods.each { |c_method| RubyProject.any_instance.stub(c_method) }

        @rp = RubyProject.new
        @rp.create_project
      end

      c_methods.each do |c_method|
        it ":#{c_method}" do
          expect(@rp).to have_received(c_method)
        end
      end

    end

  end

  context 'creating rvm files' do
    context 'should call method:' do
      before do
        RubyProject.any_instance.stub(:generate_erb_template)

        @rp = RubyProject.new
        @rp.generate_rvm_files
      end

      it ':generate_erb_template' do
        expect(@rp).to have_received(:generate_erb_template).at_least(:once)
      end

    end

  end

  context 'generating Gemfile' do
    context 'should call method:' do
      before do
        RubyProject.any_instance.stub(:generate_erb_template)

        @rp = RubyProject.new
        @rp.process_gemfile
      end

      it ':generate_erb_template' do
        expect(@rp).to have_received(:generate_erb_template).at_least(:once)
      end

    end

  end

end