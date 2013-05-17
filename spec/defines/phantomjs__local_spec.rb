require "spec_helper"

describe "phantomjs::local" do
  let(:default_params) do
    {
      :ensure  => "present",
      :version => "1.9.0"
    }
  end

  let(:facts) { default_test_facts }
  let(:title) { "/path/to/wherever" }
  let(:params) { default_params }

  it do
    should include_class("phantomjs::1_9_0")

    should contain_file("/path/to/wherever/.phantom-version").with({
      :ensure  => "present",
      :content => "1.9.0\n",
      :replace => true
    })
  end

  context "ensure => absent" do
    let(:params) { default_params.merge(:ensure => "absent") }

    it do
      should_not include_class("phantomjs::1_9_0")

      should contain_file("/path/to/wherever/.phantom-version").with({
        :ensure => "absent"
      })
    end
  end
end
