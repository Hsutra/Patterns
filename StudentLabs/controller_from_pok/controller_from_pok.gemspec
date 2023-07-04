# frozen_string_literal: true

require_relative "lib/controller_from_pok/version"

Gem::Specification.new do |spec|
  spec.name = "controller_from_pok"
  spec.version = '1.1.1'
  spec.authors = ["Pok"]
  spec.email = ["pok71986@gmail.com"]
  spec.summary = "Controller for Student MVC application"
  spec.description = "Controller for Student MVC application"
  spec.required_ruby_version = ">= 2.6.0"
  spec.files = Dir['data_models/*']
  spec.files += Dir['db_models/*']
  spec.files = Dir['students/*']
  spec.metadata  = { "source_code_uri" => "https://github.com/Hsutra/ProgPatterns" }


end
