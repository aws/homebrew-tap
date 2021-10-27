# -*- coding: utf-8 -*-
require_relative '../ConfigProvider/config_provider'

class XrayDaemon < Formula

  $config_provider = ConfigProvider.new('xray-daemon')

  desc "The AWS X-Ray daemon listens for traffic on UDP port 2000, gathers raw segment data, and relays it to the AWS X-Ray API."
  homepage "https://github.com/aws/aws-xray-daemon/"
  version $config_provider.version

  if OS.mac?
    url "#{$config_provider.root_url}/aws-xray-daemon-macos-#{$config_provider.version}.zip"
    sha256 $config_provider.sierra_hash
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "#{$config_provider.root_url}/aws-xray-daemon-linux-#{$config_provider.version}.zip"
      sha256 $config_provider.linux_hash
    end
  end

  def install
    if OS.mac?
      bin.install "xray_mac"
      mv bin/"xray_mac", bin/"#{$config_provider.bin}"
    else
      bin.install "xray"
      mv bin/"xray", bin/"#{$config_provider.bin}"
    end
  end

  test do
    assert_match "Usage", shell_output("#{bin}/#{$config_provider.bin} --help")
  end
end
