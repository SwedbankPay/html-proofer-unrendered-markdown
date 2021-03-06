require "spec_helper"

RSpec.describe 'Unrendered link checker' do
    it 'gives a error message when finding a broken link' do
        file = "#{FIXTURES_DIR}/unrendered_link.html"
        proofer = run_proofer(file, :file, {:check_unrendered_link => true})
        expect(proofer.failed_tests.last).to match(']\[')
    end

    it 'does not emit anything when not configured to run' do
        file = "#{FIXTURES_DIR}/unrendered_link.html"
        proofer = run_proofer(file, :file, {:check_unrendered_link => false})
        expect(proofer.failed_tests.last).to eq nil
    end

    it 'does not emit anything when configured to run and there is no problem' do
        file = "#{FIXTURES_DIR}/just_fine.html"
        proofer = run_proofer(file, :file, {:check_unrendered_link => true})
        expect(proofer.failed_tests.last).to eq nil
    end

end