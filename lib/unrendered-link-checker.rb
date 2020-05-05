class Chercker < ::HTMLProofer::Check
    def run
        return unless @options[:check_unrendered_link]
        print @html
        add_issue("Content contains unrendered link: ][")
    end
end