Gem::Specification.new do |s|
  s.name          = 'librato-cli'
  s.version       = '0.0.1'
  s.date          = '2013-10-24'
  s.summary       = "Tool to list metrics, instruments, and dashboards in Librato"
  s.description   = "librato-cli is a suite of tools to make working with Librato metrics, instruments, and dashboards easier."
  s.authors       = ["Charles Hooper"]
  s.email         = 'chooper@plumata.com'
  s.homepage      = 'https://github.com/chooper/librato-cli'
  s.license       = 'MIT'

  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]

  s.add_development_dependency "rake", "~> 10.0.4"

  s.homepage    =
    'https://github.com/chooper/elbping'
  s.license       = 'MIT'
end
