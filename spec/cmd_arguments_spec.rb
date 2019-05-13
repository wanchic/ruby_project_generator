require 'active_support/core_ext/kernel/reporting'
require 'cmd_arguments'

describe CmdArguments do
  it "should be provide a default name if no command arguments are given" do
    prog_name = CmdArguments.program_name []
    expect(prog_name).to eq('new_app')
  end

  it "should be empty if two or more command arguments are given" do
    arg = (1..((rand*10))+2).map{|| rand_name}
    prog_name = CmdArguments.program_name arg
    expect(prog_name).to be(nil)
  end

  it "should return message if two or more command arguments are given" do
    output = capture(:stdout) do
      arg = (1..((rand*10))+2).map{|| rand_name}
      prog_name = CmdArguments.program_name arg
    end

    expect(output).to include 'Please provide only one project name'
  end

  it "should be provide a name if one command argument is given" do
    arg = rand_name
    prog_name = CmdArguments.program_name [arg]
    expect(prog_name).to eq(arg)
  end

end