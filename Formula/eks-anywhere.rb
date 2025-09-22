class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.23.3"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/106/artifacts/eks-a/v0.23.3/darwin/arm64/eksctl-anywhere-v0.23.3-darwin-arm64.tar.gz"
    sha256 "e9656ee54028e7c63c7d83b3df404ad180572e6ff5d8f12e5ed2bfed45900b16"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/106/artifacts/eks-a/v0.23.3/darwin/amd64/eksctl-anywhere-v0.23.3-darwin-amd64.tar.gz"
    sha256 "c5e61341c4bfb31860b5fdd7f07a4d7182b17052acb1c69e4f7654b8b6190b53"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/106/artifacts/eks-a/v0.23.3/linux/arm64/eksctl-anywhere-v0.23.3-linux-arm64.tar.gz"
    sha256 "3458337c3fb04025a804d9ef03eb6cda1a81283aa589b3df3d23d6fc1005ef07"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/106/artifacts/eks-a/v0.23.3/linux/amd64/eksctl-anywhere-v0.23.3-linux-amd64.tar.gz"
    sha256 "0e183c4929cf543c73fe6ca0680f755df9f5c0110fdde62c8bb7313d30b01b73"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end