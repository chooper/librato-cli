require 'librato/metrics'
require 'librato/metrics/client'
require 'digest/sha1'
require 'diskcached'

module LibratoCLI
  def self.list_metrics(email, apikey, args)
    # Set a default argument
    args[0] = "*" if args[0].nil?
    self.fetch_metrics(email, apikey).each do |m|
      puts m["name"] if File.fnmatch(args[0], m["name"])
    end
  end

  private

  def self.fetch_metrics(email, apikey)
    diskcache = Diskcached.new        # default ttl = 600s
    key = self.cache_key(email, apikey, 'm_list')
    metrics = diskcache.cache(key) do
      puts '=> Cache miss: This might take a minute.'
      Librato::Metrics.authenticate email, apikey
      Librato::Metrics.list
    end
  end

  def self.cache_key(email, apikey, name)
    Digest::SHA1.hexdigest "#{email}#{apikey}#{name}"
  end
end

