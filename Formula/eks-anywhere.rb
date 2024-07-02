class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.20.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/68/artifacts/eks-a/v0.20.0/darwin/arm64/eksctl-anywhere-v0.20.0-darwin-arm64.tar.gz"
    sha256 "abf31332542ade63a6d33f3f042a777816863f7d3e765d1b25831eced58469e2"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/68/artifacts/eks-a/v0.20.0/darwin/amd64/eksctl-anywhere-v0.20.0-darwin-amd64.tar.gz"
    sha256 "df4496b0706d70e47081311f1d1ee8608800b1736eaaa1252b594e1889baac74"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/68/artifacts/eks-a/v0.20.0/linux/arm64/eksctl-anywhere-v0.20.0-linux-arm64.tar.gz"
    sha256 "d80afbb1b0f3493f6a221b7621934edb9f90e676b5a19c0cecc1592758902569"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/68/artifacts/eks-a/v0.20.0/linux/amd64/eksctl-anywhere-v0.20.0-linux-amd64.tar.gz"
    sha256 "8c538b5446c5fe89a0d86fa5c75759954a24e052ac29ca058574a18caeb3c976"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end