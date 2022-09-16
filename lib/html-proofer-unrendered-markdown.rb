# frozen_string_literal: true

require 'html/proofer/unrendered/markdown/version'

# HTMLProofer check for unrendered markdown
class UnrenderedLinkChecker < ::HTMLProofer::Check
  def run
    return unless @runner.options[:check_unrendered_link]

    node = @html.at_xpath("//*[text()[contains(.,'][')]]")

    return if node.nil?

    line_number = node.line
    content = node.to_s

    add_failure("Contains unrendered link ][! #{content}", line: line_number)
  end
end
