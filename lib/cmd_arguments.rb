module CmdArguments
  def self.program_name(argv)
    if argv.count == 1
      argv[0]
    end

  end

end
