# frozen_string_literal: true

# The Html module
module Html
  # The Proofer module
  module Proofer
    # The Unrendered module
    module Unrendered
      # The Markdown module
      module Markdown
        @version = ENV['GEM_VERSION'] || '0.0.1-INVALID'
        VERSION = @version
      end
    end
  end
end
