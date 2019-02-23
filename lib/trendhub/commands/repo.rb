# frozen_string_literal: true

require "http"
require "oga"
require 'trendhub/repositories'
require 'trendhub/utils/color'

module Trendhub
  module Commands
    class Repo
      def initialize(options)
        @options = options
      end

      def execute
        repositories = Trendhub::Repositories.new.fetch(options[:for], options[:language])
        repositories.each do |repo|
          $stdout.puts "-" * 100
          $stdout.puts "#{colorizer.decorate(repo.name, :bold)} has #{colorizer.decorate(repo.added_stars, :bold, :red)} stars added #{repo.time_period}"
          $stdout.puts repo.desc
          repo_info = blank?(repo.language) ? "" : "#{repo.language}          "
          repo_info += "★  #{repo.stars}          "
          repo_info += "#{repo.forks} forks"
          $stdout.puts repo_info
          $stdout.puts "URL: #{repo.url}"
        end
      end

      private

      attr_reader :options

      def blank?(str)
        str.nil? || str.empty? || str.match?(/^\s+$/)
      end

      def colorizer
        @colorizer ||= Trendhub::Utils::Color.new
      end
    end
  end
end
