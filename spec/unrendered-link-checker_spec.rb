require "spec_helper"

RSpec.describe Unrendered::Link::Checker do
    if 'gives error when finding unrendered link' do
        file = "#{FIXTURES_DIR}/unrendered_link.html"
        proofer = run_proofer(file, :file, {:check_unrendered_link => true})
        expect(proofer.failed_tests.last).to eq nil
    end

end