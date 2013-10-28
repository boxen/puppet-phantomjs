require "spec_helper"

describe "phantomjs" do
  let(:facts) { default_test_facts }

  it do
    should include_class("boxen::config")
    should contain_package("phantomjs").with_ensure(:absent)

    should contain_file("/test/boxen/env.d/phantomenv.sh").with_ensure(:absent)
    should contain_boxen__env_script("phantomjs")

    should contain_repository("/test/boxen/phantomenv").with({
      :ensure => "v0.0.8",
      :source => "wfarr/phantomenv",
      :user   => "testuser"
    })
  end

  context "linux" do
    let(:facts) { default_test_facts.merge(:osfamily => "Linux") }

    it do
      should_not include_class("boxen::config")
      should_not contain_package("phantomjs").with_ensure(:absent)
      should_not contain_boxen__env_script("phantomjs")
    end
  end
end
