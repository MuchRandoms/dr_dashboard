# -*- encoding: utf-8 -*-
# stub: dashing 1.3.4 ruby lib

Gem::Specification.new do |s|
  s.name = "dashing"
  s.version = "1.3.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Daniel Beauchamp"]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIDcDCCAligAwIBAgIBATANBgkqhkiG9w0BAQUFADA/MQ8wDQYDVQQDDAZhZG1p\nbnMxFzAVBgoJkiaJk/IsZAEZFgdzaG9waWZ5MRMwEQYKCZImiZPyLGQBGRYDY29t\nMB4XDTE0MDUxNTIwMzM0OFoXDTE1MDUxNTIwMzM0OFowPzEPMA0GA1UEAwwGYWRt\naW5zMRcwFQYKCZImiZPyLGQBGRYHc2hvcGlmeTETMBEGCgmSJomT8ixkARkWA2Nv\nbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAL0/81O3e1vh5smcwp2G\nMpLQ6q0kejQLa65bPYPxdzWA1SYOKyGfw+yR9LdFzsuKpwWzKq6zX35lj1IckWS4\nbNBEQzxmufUxU0XPM02haFB8fOfDJzdXsWte9Ge4IFwahwn68gpMqN+BvxL+KMYz\nIut9YmN44d4LZdsENEIO5vmybuG2vYDz7R56qB0PA+Q2P2CdhymsBad2DQs69FBo\nuico9V6VMYYctL9lCYdzu9IXrOYNTt88suKIVzzAlHOKeN0Ng5qdztFoTR8sfxDr\nYdg3KHl5n47wlpgd8R0f/4b5gGxW+v9pyJCgQnLlRu7DedVSvv7+GMtj3g9r3nhJ\nKqECAwEAAaN3MHUwCQYDVR0TBAIwADALBgNVHQ8EBAMCBLAwHQYDVR0OBBYEFI/o\nmaf34HXbUOQsdoLHacEKQgunMB0GA1UdEQQWMBSBEmFkbWluc0BzaG9waWZ5LmNv\nbTAdBgNVHRIEFjAUgRJhZG1pbnNAc2hvcGlmeS5jb20wDQYJKoZIhvcNAQEFBQAD\nggEBADkK9aj5T0HPExsov4EoMWFnO+G7RQ28C30VAfKxnL2UxG6i4XMHVs6Xi94h\nqXFw1ec9Y2eDUqaolT3bviOk9BB197+A8Vz/k7MC6ci2NE+yDDB7HAC8zU6LAx8Y\nIqvw7B/PSZ/pz4bUVFlTATif4mi1vO3lidRkdHRtM7UePSn2rUpOi0gtXBP3bLu5\nYjHJN7wx5cugMEyroKITG5gL0Nxtu21qtOlHX4Hc4KdE2JqzCPOsS4zsZGhgwhPs\nfl3hbtVFTqbOlwL9vy1fudXcolIE/ZTcxQ+er07ZFZdKCXayR9PPs64heamfn0fp\nTConQSX2BnZdhIEYW+cKzEC/bLc=\n-----END CERTIFICATE-----\n"]
  s.date = "2014-05-30"
  s.description = "This framework lets you build & easily layout dashboards with your own custom widgets. Use it to make a status boards for your ops team, or use it to track signups, conversion rates, or whatever else metrics you'd like to see in one spot. Included with the framework are ready-made widgets for you to use or customize. All of this code was extracted out of a project at Shopify that displays dashboards on TVs around the office."
  s.email = "daniel.beauchamp@shopify.com"
  s.executables = ["dashing"]
  s.files = ["bin/dashing"]
  s.homepage = "http://shopify.github.com/dashing"
  s.rubygems_version = "2.4.3"
  s.summary = "The exceptionally handsome dashboard framework."

  s.installed_by_version = "2.4.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sass>, ["~> 3.2.12"])
      s.add_runtime_dependency(%q<coffee-script>, ["~> 2.2.0"])
      s.add_runtime_dependency(%q<execjs>, ["~> 2.0.2"])
      s.add_runtime_dependency(%q<sinatra>, ["~> 1.4.4"])
      s.add_runtime_dependency(%q<sinatra-contrib>, ["~> 1.4.2"])
      s.add_runtime_dependency(%q<thin>, ["~> 1.6.1"])
      s.add_runtime_dependency(%q<rufus-scheduler>, ["~> 2.0.24"])
      s.add_runtime_dependency(%q<thor>, ["~> 0.18.1"])
      s.add_runtime_dependency(%q<sprockets>, ["~> 2.10.1"])
      s.add_runtime_dependency(%q<rack>, ["~> 1.5.2"])
      s.add_development_dependency(%q<rake>, ["~> 10.1.0"])
      s.add_development_dependency(%q<haml>, ["~> 4.0.4"])
      s.add_development_dependency(%q<minitest>, ["~> 5.2.0"])
      s.add_development_dependency(%q<mocha>, ["~> 0.14.0"])
      s.add_development_dependency(%q<fakeweb>, ["~> 1.3.0"])
      s.add_development_dependency(%q<simplecov>, ["~> 0.8.2"])
    else
      s.add_dependency(%q<sass>, ["~> 3.2.12"])
      s.add_dependency(%q<coffee-script>, ["~> 2.2.0"])
      s.add_dependency(%q<execjs>, ["~> 2.0.2"])
      s.add_dependency(%q<sinatra>, ["~> 1.4.4"])
      s.add_dependency(%q<sinatra-contrib>, ["~> 1.4.2"])
      s.add_dependency(%q<thin>, ["~> 1.6.1"])
      s.add_dependency(%q<rufus-scheduler>, ["~> 2.0.24"])
      s.add_dependency(%q<thor>, ["~> 0.18.1"])
      s.add_dependency(%q<sprockets>, ["~> 2.10.1"])
      s.add_dependency(%q<rack>, ["~> 1.5.2"])
      s.add_dependency(%q<rake>, ["~> 10.1.0"])
      s.add_dependency(%q<haml>, ["~> 4.0.4"])
      s.add_dependency(%q<minitest>, ["~> 5.2.0"])
      s.add_dependency(%q<mocha>, ["~> 0.14.0"])
      s.add_dependency(%q<fakeweb>, ["~> 1.3.0"])
      s.add_dependency(%q<simplecov>, ["~> 0.8.2"])
    end
  else
    s.add_dependency(%q<sass>, ["~> 3.2.12"])
    s.add_dependency(%q<coffee-script>, ["~> 2.2.0"])
    s.add_dependency(%q<execjs>, ["~> 2.0.2"])
    s.add_dependency(%q<sinatra>, ["~> 1.4.4"])
    s.add_dependency(%q<sinatra-contrib>, ["~> 1.4.2"])
    s.add_dependency(%q<thin>, ["~> 1.6.1"])
    s.add_dependency(%q<rufus-scheduler>, ["~> 2.0.24"])
    s.add_dependency(%q<thor>, ["~> 0.18.1"])
    s.add_dependency(%q<sprockets>, ["~> 2.10.1"])
    s.add_dependency(%q<rack>, ["~> 1.5.2"])
    s.add_dependency(%q<rake>, ["~> 10.1.0"])
    s.add_dependency(%q<haml>, ["~> 4.0.4"])
    s.add_dependency(%q<minitest>, ["~> 5.2.0"])
    s.add_dependency(%q<mocha>, ["~> 0.14.0"])
    s.add_dependency(%q<fakeweb>, ["~> 1.3.0"])
    s.add_dependency(%q<simplecov>, ["~> 0.8.2"])
  end
end
