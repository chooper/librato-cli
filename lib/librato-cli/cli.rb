#!/usr/bin/env ruby

require 'optparse'
require 'librato-cli.rb'

module LibratoCLI
  # Setup and initialization for running as a CLI app happens here. Specifically, on load it will
  # read in environment variables and set up default values for the app.
  module CLI

    # Set up default options
    OPTIONS = {}

    # Build parser for command line options
    PARSER = OptionParser.new do |opts|
      opts.banner = "Usage: #{$0} [options] cmd <cmd args>"

      #opts.on("-L LENGTH", "--verb-length LENGTH", Integer,
      #  "Use verb LENGTH characters long (default: #{OPTIONS[:verb_len]})") do |n|
      #  OPTIONS[:verb_len] = n
      #end
    end

    # Displays usage
    def self.usage
      puts PARSER.help
      exit(false)
    end

    # Main entry point of the program. Specifically, this method will:
    #
    # * Parse and validate command line arguments
    # * TBD

    def self.main
      # Catch ctrl-c
      trap("SIGINT") {
        exit(true)
      }

      ##
      # Parse and validate command line arguments
      PARSER.parse!(ARGV) rescue usage

      if ARGV.size < 1
        usage
      end

      # Argument validation
      unless ARGV[0] == 'ls-metrics'
        puts PARSER.help
        puts "Invalid command: #{ARGV[0]}"
        exit(false)
      end

      # TODO: Cleanly map commands with routines
      cmd = ARGV[0]
      LibratoCLI.list_metrics if cmd == 'ls-metrics'
    end
  end
end
