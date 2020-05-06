class Chercker < ::HTMLProofer::Check
    def run
        return unless @options[:check_unrendered_link]
        #@logger.log @html, "hello"
        if @html.include? "]\["
            add_issue("Content contains unrendered link: ][")
        end
    end
end