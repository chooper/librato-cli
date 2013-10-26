#!/usr/bin/env ruby

require 'optparse'
require 'librato-cli.rb'

module LibratoCLI
  # Setup and initialization for running as a CLI app happens here. Specifically, on load it will
  # read in environment variables and set up default values for the app.
  module CLI

    # Set up default options
    OPTIONS = {}
    OPTIONS[:email]        = ENV['LIBRATO_EMAIL']
    OPTIONS[:key]          = ENV['LIBRATO_API_KEY']

    # Build parser for command line options
    PARSER = OptionParser.new do |opts|
      opts.banner = "Usage: #{$0} [options] cmd <cmd args>"

      opts.on("-e EMAIL", "--email EMAIL", String,
        "Use EMAIL for API access (default: #{OPTIONS[:email]})") do |n|
        OPTIONS[:email] = n
      end
      opts.on("-k KEY", "--key KEY", String,
        "Use KEY for API access (default: #{OPTIONS[:key]})") do |n|
        OPTIONS[:key] = n
      end
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

      if OPTIONS[:email].nil? or OPTIONS[:key].nil?
        puts PARSER.help
        puts "Need email address and API key to continue"
        exit(false)
      end

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
      ARGV.shift
      LibratoCLI.list_metrics(OPTIONS[:email], OPTIONS[:key], ARGV) if cmd == 'ls-metrics'
    end
  end
end
