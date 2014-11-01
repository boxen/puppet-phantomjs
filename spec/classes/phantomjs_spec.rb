require "spec_helper"

describe "phantomjs" do
  let(:facts) { default_test_facts }

  it do
    should contain_package("phantomjs")
  end
end
