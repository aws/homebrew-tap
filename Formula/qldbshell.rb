# -*- coding: utf-8 -*-
require_relative '../ConfigProvider/config_provider'

class Qldbshell < Formula

  $config_provider = ConfigProvider.new('qldbshell')

  desc "A CLI for interacting with QLDB ledgers"
  homepage "https://github.com/awslabs/amazon-qldb-shell"
  version $config_provider.version

  if OS.mac?
    # e.g. https://github.com/awslabs/amazon-qldb-shell/releases/download/v2.0.9/qldb-v2.0.9-mac.tar.gz
    url "#{$config_provider.root_url}v#{$config_provider.version}/#{$config_provider.bin}-v#{$config_provider.version}-mac.tar.gz"
    sha256 $config_provider.sierra_hash
  elsif OS.linux?
    # e.g. https://github.com/awslabs/amazon-qldb-shell/releases/download/v2.0.9/qldb-v2.0.9-linux.tar.gz
    url "#{$config_provider.root_url}v#{$config_provider.version}/#{$config_provider.bin}-v#{$config_provider.version}-linux.tar.gz"
    sha256 $config_provider.linux_hash
  end

  def install
    bin.install $config_provider.bin
    puts "Run `qldb --ledger <your ledger name>` to start using the QLDB Shell"
  end
end
