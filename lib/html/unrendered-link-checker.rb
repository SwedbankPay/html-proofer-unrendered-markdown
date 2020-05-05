class Unrendered::Link::Checker < ::HTMLProofer::Check

    def run
        return unless @options[:check_unrendered_link]

    end
end