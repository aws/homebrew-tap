class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.19.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/61/artifacts/eks-a/v0.19.1/darwin/arm64/eksctl-anywhere-v0.19.1-darwin-arm64.tar.gz"
    sha256 "8185f6840649a1a7759e6f2c48bd71232c84900be57d294e9c510e93c1e29f71"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/61/artifacts/eks-a/v0.19.1/darwin/amd64/eksctl-anywhere-v0.19.1-darwin-amd64.tar.gz"
    sha256 "23b432d72a5672c5cb2863da29a2fcc8248a8726d75c60cba738bda53d46a746"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/61/artifacts/eks-a/v0.19.1/linux/arm64/eksctl-anywhere-v0.19.1-linux-arm64.tar.gz"
    sha256 "997edfe9354b09e348b9a0cc449e505a979e5e17c04b6e287cfc71cbd6b82183"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/61/artifacts/eks-a/v0.19.1/linux/amd64/eksctl-anywhere-v0.19.1-linux-amd64.tar.gz"
    sha256 "d51ec359ae52c9c8e4c4c4d6a5b8315e16c09a2e6424b1ca16e3bdf7db924fb1"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end