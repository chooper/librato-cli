require 'librato/metrics'
require 'librato/metrics/client'

module LibratoCLI
  def self.list_metrics(email, apikey, args)
    Librato::Metrics.authenticate email, apikey
    metrics = Librato::Metrics.list
    metrics.each do |m|
      if ARGV[0].nil? or File.fnmatch(ARGV[0], m["name"])
        puts m["name"]
      end
    end
  end
end

