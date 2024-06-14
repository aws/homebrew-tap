class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.19.7"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/67/artifacts/eks-a/v0.19.7/darwin/arm64/eksctl-anywhere-v0.19.7-darwin-arm64.tar.gz"
    sha256 "67e5f00db4aa723174b725b4dd5c728e07afe47feecda74c82ea132ef82f1453"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/67/artifacts/eks-a/v0.19.7/darwin/amd64/eksctl-anywhere-v0.19.7-darwin-amd64.tar.gz"
    sha256 "a07295ea08064bfa5d5664aa2e72df415d87e5a48b65b58ad8d4f5c74b5cb60b"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/67/artifacts/eks-a/v0.19.7/linux/arm64/eksctl-anywhere-v0.19.7-linux-arm64.tar.gz"
    sha256 "91efeda7e6826a1d74f0db0ecb5ed845476bea6b00c6a2d397d9e631781ef031"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/67/artifacts/eks-a/v0.19.7/linux/amd64/eksctl-anywhere-v0.19.7-linux-amd64.tar.gz"
    sha256 "cb2f82d745fd87075dc9ba7fd1cbafca49688bc714ffc11fff0bff83cb364efb"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end