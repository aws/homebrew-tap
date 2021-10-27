# -*- coding: utf-8 -*-
require_relative '../ConfigProvider/config_provider'

class Ec2InstanceSelector < Formula

  $config_provider = ConfigProvider.new('ec2-instance-selector')

  desc "EC2 Instance Selector is a tool to filter EC2 instance types based on resource criteria"
  homepage "https://github.com/aws/amazon-ec2-instance-selector/"
  version $config_provider.version

  if OS.mac?
    if Hardware::CPU.intel?
      url "#{$config_provider.root_url}-darwin-amd64.tar.gz"
      sha256 $config_provider.sierra_hash
    elsif Hardware::CPU.arm?
      url "#{$config_provider.root_url}-darwin-arm64.tar.gz"
      sha256 $config_provider.arm64_big_sur_hash
    end
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
    assert_match "Usage", shell_output("#{bin}/ec2-instance-selector --help")
  end
end
