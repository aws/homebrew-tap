class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.23.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/103/artifacts/eks-a/v0.23.1/darwin/arm64/eksctl-anywhere-v0.23.1-darwin-arm64.tar.gz"
    sha256 "542b290d9c9b8f804fe2be5f699ad23b2878359e69faf914284fc5cd2af10e2b"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/103/artifacts/eks-a/v0.23.1/darwin/amd64/eksctl-anywhere-v0.23.1-darwin-amd64.tar.gz"
    sha256 "d061c2807256fb46b8db5f1ddfc554610141af7540177b94ce20c2339b73b512"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/103/artifacts/eks-a/v0.23.1/linux/arm64/eksctl-anywhere-v0.23.1-linux-arm64.tar.gz"
    sha256 "c8f25ba2c524d8cf08665d4d724fd546fb323439c4cd88a7a072958473d4ed63"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/103/artifacts/eks-a/v0.23.1/linux/amd64/eksctl-anywhere-v0.23.1-linux-amd64.tar.gz"
    sha256 "3cceb7f15f8f8e820abf66f3c699f7e29bc4b5903f7112dc6c383920b3735bb8"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end