# -*- coding: utf-8 -*-
require_relative '../ConfigProvider/config_provider'

class CopilotCli < Formula
    $config_provider = ConfigProvider.new('copilot-cli')

    desc "Copilot CLI - build, release and operate your container apps on AWS"
    homepage "https://aws.github.io/copilot-cli/"
    version $config_provider.version

    if OS.mac?
      if Hardware::CPU.intel?
        url "#{$config_provider.root_url}macOS_amd64.tar.gz"
        sha256 $config_provider.sierra_hash
      elsif Hardware::CPU.arm?
        url "#{$config_provider.root_url}macOS_arm64.tar.gz"
        sha256 $config_provider.arm64_big_sur_hash
      end
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "#{$config_provider.root_url}linux_amd64.tar.gz"
        sha256 $config_provider.linux_hash
      end
    end

    def install
      bin.install $config_provider.bin

      # Install bash completion
      output = Utils.safe_popen_read({ "SHELL" => "bash" }, "#{bin}/copilot", "completion", "bash")
      (bash_completion/"copilot").write output
  
      # Install zsh completion
      output = Utils.safe_popen_read({ "SHELL" => "zsh" }, "#{bin}/copilot", "completion", "zsh")
      (zsh_completion/"_copilot").write output
    end

    test do
        assert_match "Getting Started", shell_output("#{bin}/#{$config_provider.bin} --help")
    end
  end
