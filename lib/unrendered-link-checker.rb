class Chercker < ::HTMLProofer::Check
    def run
        return unless @options[:check_unrendered_link]
        @html.xpath("//*[text()[contains(.,'][')]]").each do |node|
            line = node.line
            content = node.to_s
            add_issue("Contains unrendered link ][!", line: line, content: content)
          end
    end
end