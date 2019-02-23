# frozen_string_literal: true

require "trendhub/version"
require "trendhub/cli"

module Trendhub
  Error = Class.new(StandardError)

  def self.root
    File.dirname(__dir__)
  end
end
