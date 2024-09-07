class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.20.5"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/75/artifacts/eks-a/v0.20.5/darwin/arm64/eksctl-anywhere-v0.20.5-darwin-arm64.tar.gz"
    sha256 "65afad2d89ea1464de55438e2fcb5393954d3f1bde7d0b6b30d7ca43ff22d0c5"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/75/artifacts/eks-a/v0.20.5/darwin/amd64/eksctl-anywhere-v0.20.5-darwin-amd64.tar.gz"
    sha256 "86610a8a893e1f2752a3ee71bd6161700d569dfacb20f9756ff36215c60d4817"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/75/artifacts/eks-a/v0.20.5/linux/arm64/eksctl-anywhere-v0.20.5-linux-arm64.tar.gz"
    sha256 "360dfb2d2fcfcea499c7dafd210c7cbd749930c3e792dd748130ea0a3a96c691"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/75/artifacts/eks-a/v0.20.5/linux/amd64/eksctl-anywhere-v0.20.5-linux-amd64.tar.gz"
    sha256 "e1e9c0a27b185ba61e71d8e1873f3de77ec35fd3d80cb8cebd9305c871b37ae4"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end