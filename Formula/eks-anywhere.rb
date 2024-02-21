class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.18.7"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/59/artifacts/eks-a/v0.18.7/darwin/arm64/eksctl-anywhere-v0.18.7-darwin-arm64.tar.gz"
    sha256 "704030f769f2431865a184fd8a4fab0820c4b2bd4139e1ee6f39a2012e447115"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/59/artifacts/eks-a/v0.18.7/darwin/amd64/eksctl-anywhere-v0.18.7-darwin-amd64.tar.gz"
    sha256 "66c1dceaeb3cd98b69edd66a72cc60f4c008218a7bafc426c35fd6e5c1e69dc8"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/59/artifacts/eks-a/v0.18.7/linux/arm64/eksctl-anywhere-v0.18.7-linux-arm64.tar.gz"
    sha256 "0cbf674b0644fc222d7c81e4eba1abe25d3c499e274cf4a045d3b74f7e837ba1"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/59/artifacts/eks-a/v0.18.7/linux/amd64/eksctl-anywhere-v0.18.7-linux-amd64.tar.gz"
    sha256 "d4adfb30a45553debf6292bee4ac69a525bb11604691253001fbb222c6ef2db6"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end