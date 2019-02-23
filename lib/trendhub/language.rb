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
  end
end
