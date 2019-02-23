# frozen_string_literal: true

module Trendhub
  module Utils
    class Color
      InvalidColorFormat = Class.new(StandardError)

      ANSI = {
        reset: 0,
        bold: 1,
        dim: 2,
        italic: 3,
        underline: 4,
        black: 30,
        red: 31,
        green: 32,
        yellow: 33,
        blue: 34,
        magenta: 35,
        cyan: 36,
        light_gray: 37,
        dark_gray: 90,
        light_red: 91,
        light_green: 92,
        light_yellow: 93,
        light_blue: 94,
        light_magenta: 95,
        light_cyan: 96,
        white: 97,
      }.freeze

      def decorate(str, *formats)
        return str if blank?(str) || formats.empty?
        raise InvalidColorFormat unless (formats - ANSI.keys).empty?
        format_codes = formats.map { |format| ANSI[format] }
        "\e[#{format_codes.join(';')}m#{str}\e[0m"
      end

      private

      def blank?(str)
        str.nil? || str.empty? || str.match?(/^\s+$/)
      end
    end
  end
end
