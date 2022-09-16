require "html/proofer/unrendered/markdown/version"

class UnrenderedLinkChecker < ::HTMLProofer::Check
  def run
    return unless @runner.options[:check_unrendered_link]

    @html.xpath("//*[text()[contains(.,'][')]]").each do |node|
      line = node.line
      content = node.to_s
      return add_failure("Contains unrendered link ][! #{content}", line: line)
    end
  end
end
