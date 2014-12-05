require "spec_helper"

describe "phantomjs::1_9_8" do
  let(:facts) { default_test_facts }

  it do
    should contain_phantomjs__version("1.9.8")
  end
end
