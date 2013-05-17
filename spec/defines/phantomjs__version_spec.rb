require "spec_helper"

describe "phantomjs::version" do
  let(:default_params) do
    {
      :ensure => :present
    }
  end

  let(:facts) { default_test_facts }
  let(:title) { "1.2.3" }

  it do
    should include_class("phantomjs")

    should contain_exec("phantomenv install 1.2.3").with({
      :command  => "/test/boxen/phantomenv/bin/phantomenv install 1.2.3",
      :creates  => "/test/boxen/phantomenv/versions/1.2.3",
      :provider => "shell",
      :user     => "testuser"
    })
  end

  context "ensure => absent" do
    let(:params) { default_params.merge(:ensure => "absent") }

    it do
      should contain_file("/test/boxen/phantomenv/versions/1.2.3").with({
        :ensure => "absent",
        :force  => true
      })
    end
  end
end
