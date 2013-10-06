# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "cathodic"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Paul Forti"]
  s.date = "2013-03-30"
  s.description = "Cathodic helps users retreiving the data from a twitch tv stream, such as the number of viewers, \n                   a preview thumbnail, the embed code, the status etc from the twitch channel's url"
  s.email = ["paul@itsbi.fr"]
  s.homepage = "https://github.com/kustom666/cathodic"
  s.require_paths = ["lib"]
  s.rubyforge_project = "cathodic"
  s.rubygems_version = "1.8.25"
  s.summary = "Gets a twitch.tv stream's info from the api"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<json>, [">= 0"])
      s.add_runtime_dependency(%q<json>, [">= 0"])
    else
      s.add_dependency(%q<json>, [">= 0"])
      s.add_dependency(%q<json>, [">= 0"])
    end
  else
    s.add_dependency(%q<json>, [">= 0"])
    s.add_dependency(%q<json>, [">= 0"])
  end
end
