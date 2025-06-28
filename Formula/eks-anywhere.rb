class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.23.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/101/artifacts/eks-a/v0.23.0/darwin/arm64/eksctl-anywhere-v0.23.0-darwin-arm64.tar.gz"
    sha256 "2ef982e2fe70f7402d2807f71e8c18701f7aa31819792cfc07ebf67a2a79ea7c"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/101/artifacts/eks-a/v0.23.0/darwin/amd64/eksctl-anywhere-v0.23.0-darwin-amd64.tar.gz"
    sha256 "cb4877a3909e45a2a5209a5c12ef1a41d03aa1d494ab7e387b47fec9b74f2449"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/101/artifacts/eks-a/v0.23.0/linux/arm64/eksctl-anywhere-v0.23.0-linux-arm64.tar.gz"
    sha256 "fd6454cd786368c7ef4e75b456ecaceaf609db0c74c24a0e2936a341b2291ce2"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/101/artifacts/eks-a/v0.23.0/linux/amd64/eksctl-anywhere-v0.23.0-linux-amd64.tar.gz"
    sha256 "cf3097d40b0b6fc9b2a8df2942d4766001a25b0aa91266cebe19dda19c7e1724"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end