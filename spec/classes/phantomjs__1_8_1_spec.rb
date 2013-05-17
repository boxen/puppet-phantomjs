require "spec_helper"

describe "phantomjs::1_8_1" do
  let(:facts) { default_test_facts }

  it do
    should contain_phantomjs__version("1.8.1")
  end
end
