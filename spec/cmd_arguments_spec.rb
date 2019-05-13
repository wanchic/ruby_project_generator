require 'cmd_arguments'

def rand_name
  c = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
  (1..((rand*25)+1)).map{|| c[rand * c.size]}.join
end

describe CmdArguments do
  it "should be empty if no command arguments are given" do
    prog_name = CmdArguments.program_name []
    expect(prog_name).to be(nil)
  end

  it "should be empty if two or more command arguments are given" do
    arg = (2..((rand*10))+2).map{|| rand_name}
    prog_name = CmdArguments.program_name arg
    expect(prog_name).to be(nil)
  end

  it "should be provide a name if one command argument is given" do
    prog_name = CmdArguments.program_name [rand_name]
    expect(prog_name).to be(prog_name)
  end

end