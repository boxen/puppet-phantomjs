require "spec_helper"

describe "phantomjs::1_9_2" do
  let(:facts) { default_test_facts }

  it do
    should contain_phantomjs__version("1.9.2")
  end
end
