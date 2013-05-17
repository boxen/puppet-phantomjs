require "spec_helper"

describe "phantomjs::global" do
  let(:facts) { default_test_facts }
  let(:params) do
    {
      :version => "1.9.0"
    }
  end

  it do
    should include_class("phantomjs")
    should include_class("phantomjs::1_9_0")

    should contain_file("/test/boxen/phantomenv/version").with({
      :content => "1.9.0\n",
    })
  end
end
