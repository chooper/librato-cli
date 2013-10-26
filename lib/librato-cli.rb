require 'librato/metrics'
require 'librato/metrics/client'

module LibratoCLI
  def self.list_metrics(email, apikey)
    Librato::Metrics.authenticate email, apikey
    metrics = Librato::Metrics.list
    metrics.each do |m|
      puts m["name"]
    end
  end
end

