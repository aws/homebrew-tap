# -*- coding: utf-8 -*-
require_relative '../ConfigProvider/config_provider'

class EksNodeViewer < Formula

  $config_provider = ConfigProvider.new('eks-node-viewer')

  desc "eks-node-viewer is a tool for visualizing dynamic node usage within an EKS cluster."
  homepage "https://github.com/awslabs/eks-node-viewer/"
  version $config_provider.version

  if OS.mac?
    $suffix = "_Darwin_all"
    sha256 $config_provider.sierra_hash
  elsif OS.linux?
    if Hardware::CPU.intel?
      $suffix = "_Linux_x86_64"
      sha256 $config_provider.linux_hash
    elsif Hardware::CPU.arm?
      $suffix = "_Linux_arm64"
      sha256 $config_provider.linux_arm_hash
    end
  end

  url "#{$config_provider.root_url}#{$suffix}"

  def install
    bin.install "#{$config_provider.bin}#{$suffix}" => "eks-node-viewer"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/eks-node-viewer --help")
  end
end
