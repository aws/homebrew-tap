# -*- coding: utf-8 -*-
require_relative '../ConfigProvider/config_provider'

class CopilotCli < Formula
    $config_provider = ConfigProvider.new('copilot-cli')

    desc "Copilot CLI - build, release and operate your container apps on AWS"
    homepage "https://aws.github.io/copilot-cli/"
    version $config_provider.version
    bottle :unneeded

    if OS.mac?
      url "#{$config_provider.root_url}macOS_amd64.tar.gz"
      sha256 $config_provider.sierra_hash
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "#{$config_provider.root_url}linux_amd64.tar.gz"
        sha256 $config_provider.linux_hash
      end
    end

    def install
      bin.install $config_provider.bin

      # Install bash completion
      (bash_completion/$config_provider.bin).write `#{bin}/#{$config_provider.bin} completion bash`

      # Install zsh completion
      (zsh_completion/$config_provider.bin).write `#{bin}/#{$config_provider.bin} completion zsh`
    end

    test do
        assert_match "Getting Started", shell_output("#{bin}/#{$config_provider.bin} --help")
    end
  end
