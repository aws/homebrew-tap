# -*- coding: utf-8 -*-
require_relative '../ConfigProvider/config_provider'

class AwsSimpleEc2Cli < Formula

  $config_provider = ConfigProvider.new('aws-simple-ec2-cli')

  desc "AWS Simple EC2 CLI is a tool that simplifies the process of launching, connecting and terminating EC2 instances."
  homepage "https://github.com/awslabs/aws-simple-ec2-cli/"
  version $config_provider.version
  bottle :unneeded

  if OS.mac?
    url "#{$config_provider.root_url}-darwin-amd64.tar.gz"
    sha256 $config_provider.sierra_hash
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "#{$config_provider.root_url}-linux-amd64.tar.gz"
      sha256 $config_provider.linux_hash
    elsif Hardware::CPU.arm?
      url "#{$config_provider.root_url}-linux-arm64.tar.gz"
      sha256 $config_provider.linux_arm_hash
    end
  end

  def install
    bin.install $config_provider.bin
  end

  test do
    assert_match "Usage", shell_output("#{bin}/aws-simple-ec2-cli --help")
  end
end
