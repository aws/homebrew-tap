# -*- coding: utf-8 -*-
require_relative '../ConfigProvider/config_provider'

class EksAutoModeEbsMigrationTool < Formula

  $config_provider = ConfigProvider.new('eks-auto-mode-ebs-migration-tool')

  desc "eks-auto-mode-ebs-migration-tool is used to migrate a Persistent Volume Claim from a standard EBS CSI StorageClass (ebs.csi.aws.com) to the EKS Auto EBS CSI StorageClass (ebs.csi.eks.amazonaws.com)"
  homepage "https://github.com/awslabs/eks-auto-mode-ebs-migration-tool/"
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
    bin.install "#{$config_provider.bin}#{$suffix}" => "eks-auto-mode-ebs-migration-tool"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/eks-auto-mode-ebs-migration-tool --help")
  end
end
