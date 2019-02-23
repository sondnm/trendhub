# frozen_string_literal: true

module Trendhub
  class Repository
    attr_reader :name
    attr_reader :time_range
    attr_reader :url
    attr_reader :desc
    attr_reader :language
    attr_reader :added_stars
    attr_reader :stars
    attr_reader :forks

    TIME_ALIASES = {
      "daily" => "today",
      "weekly" => "this week",
      "monthly" => "this month",
    }

    def initialize(data)
      @name = data.fetch(:name)
      @time_range = data.fetch(:time_range)
      @url = data.fetch(:url)
      @desc = data.fetch(:desc)
      @language = data.fetch(:language)
      @added_stars = data.fetch(:added_stars)
      @stars = data.fetch(:stars)
      @forks = data.fetch(:forks)
    end

    def time_period
      return 'today' unless self.time_range
      TIME_ALIASES[self.time_range]
    end
  end
end
