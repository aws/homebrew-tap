class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.19.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/60/artifacts/eks-a/v0.19.0/darwin/arm64/eksctl-anywhere-v0.19.0-darwin-arm64.tar.gz"
    sha256 "6fa215400d3b6686ea09519bb5bb585bd5834d4d2b579a9547f4d30681dbdbde"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/60/artifacts/eks-a/v0.19.0/darwin/amd64/eksctl-anywhere-v0.19.0-darwin-amd64.tar.gz"
    sha256 "f3b0bc2ca8f33f1c501686174381164d56341d294329199b69df2758ee7e8029"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/60/artifacts/eks-a/v0.19.0/linux/arm64/eksctl-anywhere-v0.19.0-linux-arm64.tar.gz"
    sha256 "b4c9df778ccdbadde0413ec3818b229beccdb868537cde6a8d8f07cd7975eaad"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/60/artifacts/eks-a/v0.19.0/linux/amd64/eksctl-anywhere-v0.19.0-linux-amd64.tar.gz"
    sha256 "15056cab0a685a9314a09cdd1a32441f1ec6c086b5da920e8bff5cf7cc7bb3af"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end