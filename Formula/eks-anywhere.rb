class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.22.5"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/99/artifacts/eks-a/v0.22.5/darwin/arm64/eksctl-anywhere-v0.22.5-darwin-arm64.tar.gz"
    sha256 "0b3c83bd26cdde0328df5ae267575e2dc9243128141b9db37fc1d6782dc080fe"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/99/artifacts/eks-a/v0.22.5/darwin/amd64/eksctl-anywhere-v0.22.5-darwin-amd64.tar.gz"
    sha256 "53538154ed457b4a62852e4cdc2537b2f8c2ec4775226f1d672394270cf8c10e"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/99/artifacts/eks-a/v0.22.5/linux/arm64/eksctl-anywhere-v0.22.5-linux-arm64.tar.gz"
    sha256 "1dd8b511608f0d0f72f46a5b63a482841eb48f6660283dffb1893b465ccbca4e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/99/artifacts/eks-a/v0.22.5/linux/amd64/eksctl-anywhere-v0.22.5-linux-amd64.tar.gz"
    sha256 "ea1ae8bd304272424b3a5a0f09ac1e48482f788ab46123c8561556c0d7ed5d65"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end