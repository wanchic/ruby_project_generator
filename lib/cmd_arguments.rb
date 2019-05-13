module CmdArguments
  def self.program_name(argv)
    if argv.count == 1
      argv[0]
    elsif argv.count == 0
      'new_app'
    else
      puts 'Please provide only one project name'
    end

  end

end
