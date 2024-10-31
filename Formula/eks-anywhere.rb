class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.21.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/81/artifacts/eks-a/v0.21.0/darwin/arm64/eksctl-anywhere-v0.21.0-darwin-arm64.tar.gz"
    sha256 "304eb738e51e1dcaeb53d09f03a0dc4750f20e359d7471b649dcdaec641510f9"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/81/artifacts/eks-a/v0.21.0/darwin/amd64/eksctl-anywhere-v0.21.0-darwin-amd64.tar.gz"
    sha256 "e7361f10696d5c1fc84fd1db4c9292997fa4a1954b89d99c4a71b46221b5ab0f"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/81/artifacts/eks-a/v0.21.0/linux/arm64/eksctl-anywhere-v0.21.0-linux-arm64.tar.gz"
    sha256 "fdbd9f0b42b786af275cb8149a9c1afb7408e1ef14fe806072840a7dcd4fff77"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/81/artifacts/eks-a/v0.21.0/linux/amd64/eksctl-anywhere-v0.21.0-linux-amd64.tar.gz"
    sha256 "7d4684e085e361328eb7e6c3a9c5fad79d84cea6b9fb1ef2b409878ca7748595"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end