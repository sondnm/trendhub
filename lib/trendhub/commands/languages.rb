# frozen_string_literal: true

require 'trendhub/language'

module Trendhub
  module Commands
    class Languages
      def execute
        system('less', Trendhub::Language.new.language_path)
      end
    end
  end
end
