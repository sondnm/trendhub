# frozen_string_literal: true

require "http"
require "oga"
require "trendhub/repository"
require "trendhub/language"

module Trendhub
  class Repositories
    InvalidLanguage = Class.new(StandardError)

    def fetch(time_range, language = nil)
      validate_language(language)

      response = HTTP.get("https://github.com/trending/#{language}?since=#{time_range}")
      doc = Oga.parse_xml(response.to_s)
      doc.css(".repo-list li").map do |repo_doc|
        repo_link = repo_doc.at_css("div h3 a")
        repo_name = repo_link.text.strip
        repo_path = repo_link.attr('href').value
        repo_url = "https://github.com#{repo_path}"
        repo_desc = repo_doc.at_css("div p").text.strip
        repo_info = repo_doc.css("div")[3]
        repo_language = repo_info.at_css("span[itemprop='programmingLanguage']")&.text&.strip
        repo_stars = repo_info.at_css("a[href='#{repo_path}/stargazers']").text.strip
        repo_forks = repo_info.at_css("a[href='#{repo_path}/network']").text.strip
        repo_added_stars = repo_info.css("svg.octicon-star").last.parent.text.gsub(/[^\d,]/, '')

        Trendhub::Repository.new(
          name: repo_name,
          url: repo_url,
          desc: repo_desc,
          language: repo_language,
          added_stars: repo_added_stars,
          forks: repo_forks,
          stars: repo_stars,
          time_range: time_range
        )
      end
    end

    private

    def validate_language(language)
      raise InvalidLanguage if language && language == "developers"
    end

    def languages
      @languages ||= Trendhub::Language.new.all
    end
  end
end
