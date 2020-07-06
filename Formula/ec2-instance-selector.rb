# -*- coding: utf-8 -*-
require_relative '../ConfigProvider/config_provider'

class Ec2InstanceSelector < Formula

  $config_provider = ConfigProvider.new('ec2-instance-selector')

  desc "EC2 Instance Selector is a tool filter EC2 instance types based on resource criteria"
  homepage "https://github.com/aws/amazon-ec2-instance-selector/"
  url $config_provider.url()
  sha256 $config_provider.sha256
  head "https://github.com/aws/amazon-ec2-instance-selector.git", :branch => "master"
  bottle do
    root_url $config_provider.root_url()
    cellar :any_skip_relocation
  end

  depends_on "go" => :build

  def install
    system "GOPROXY=direct VERSION=v#{$config_provider.version} make compile"
    bin.install "build/ec2-instance-selector"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/ec2-instance-selector --help")
  end
end
