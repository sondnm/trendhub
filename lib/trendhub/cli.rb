# frozen_string_literal: true

require "thor"
require "trendhub/commands/repo"
require "trendhub/commands/languages"

module Trendhub
  class CLI < Thor
    package_name "Trendhub CLI"
    desc "repo", "List trending repositories"

    method_option :for,
      type: :string,
      enum: %w(daily weekly monthly),
      default: "daily",
      desc: "Select from daily, weekly, monthly"
    method_option :language,
      type: :string,
      default: "",
      desc: "Select from list of supported languages"

    def repo
      Trendhub::Commands::Repo.new(options).execute
    end

    desc "languages", "List all supported languages"

    def languages
      Trendhub::Commands::Languages.new.execute
    end
  end
end
