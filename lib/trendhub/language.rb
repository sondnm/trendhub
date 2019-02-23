# frozen_string_literal: true

module Trendhub
  class Language
    attr_reader :language_path

    def initialize
      @language_path = "#{Trendhub.root}/data/languages"
    end

    def all
      File.read(language_path).split("\n")
    end

    def update
      require 'http'
      require 'yaml'

      language_url = "https://raw.githubusercontent.com/github/linguist/master/lib/linguist/languages.yml"
      response = HTTP.get(language_url)
      languages = YAML.load(response.to_s).keys.map do |language|
        language.downcase.gsub(" ", "-")
      end
      File.write(language_path, languages.join("\n"))
    end
  end
end
