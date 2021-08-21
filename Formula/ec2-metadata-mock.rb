# -*- coding: utf-8 -*-
require_relative '../ConfigProvider/config_provider'

class Ec2MetadataMock < Formula

  $config_provider = ConfigProvider.new('ec2-metadata-mock')

  desc "EC2 Metadata Mock is a testing tool to mock out the EC2 Instance Metadata Service"
  homepage "https://github.com/aws/amazon-ec2-metadata-mock/"
  version $config_provider.version
  bottle :unneeded

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
    assert_match "Usage", shell_output("#{bin}/ec2-metadata-mock --help")
  end
end
