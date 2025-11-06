class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.24.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/108/artifacts/eks-a/v0.24.0/darwin/arm64/eksctl-anywhere-v0.24.0-darwin-arm64.tar.gz"
    sha256 "a0d0c75adcdffc405b08ef054b6197c7252d389a8ff9e73d48112d9b02acee01"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/108/artifacts/eks-a/v0.24.0/darwin/amd64/eksctl-anywhere-v0.24.0-darwin-amd64.tar.gz"
    sha256 "50d839bf037728d1f17e691b95dea70abb242aa39af4922d63c062fc0ef2bb27"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/108/artifacts/eks-a/v0.24.0/linux/arm64/eksctl-anywhere-v0.24.0-linux-arm64.tar.gz"
    sha256 "aef21a1b70e433c90b1eb3ffa00813c79c325f8d6fc36476b595fc70a8bbc019"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/108/artifacts/eks-a/v0.24.0/linux/amd64/eksctl-anywhere-v0.24.0-linux-amd64.tar.gz"
    sha256 "fc3a878b0207375451815324a934e1aabb98b9f0d1de359da78514bbdad7a89b"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end