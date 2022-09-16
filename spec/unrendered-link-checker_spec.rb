require "its"
require "html-proofer"
require "html-proofer-unrendered-markdown"

RSpec.describe "Unrendered link checker" do
  subject(:failed_checks) do
    path = File.join(__dir__, "fixtures", file)
    options = {
       :checks => [UnrenderedLinkChecker.to_s],
       :check_unrendered_link => check_unrendered_link
    }
    proofer = HTMLProofer.check_file(path, options)
    capture_stderr { proofer.run }
    proofer.failed_checks
  end

  context "gives an error message when finding a broken link" do
    let(:file) { "unrendered_link.html" }
    let(:check_unrendered_link) { true }
    it { is_expected.not_to be_empty }

    describe 'the last failed check' do
      subject { failed_checks.last }
      its(:check_name) { is_expected.to eq UnrenderedLinkChecker.to_s }
      its(:description) { is_expected.to include 'Contains unrendered link ][' }
    end
  end

  context "does not emit anything when not configured to run" do
    let(:file) { "unrendered_link.html" }
    let(:check_unrendered_link) { false }
    it { is_expected.to be_empty }
    its(:last) { is_expected.to be_nil }
  end

  context "does not emit anything when configured to run and there is no problem" do
    let(:file) { "just_fine.html" }
    let(:check_unrendered_link) { true }
    it { is_expected.to be_empty }
    its(:last) { is_expected.to be_nil }
  end
end
