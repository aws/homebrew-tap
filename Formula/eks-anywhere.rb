class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.22.6"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/100/artifacts/eks-a/v0.22.6/darwin/arm64/eksctl-anywhere-v0.22.6-darwin-arm64.tar.gz"
    sha256 "3f15f04aa7c4f4ab96f14e6bca58b322a725616a6b5857827f1ca9908c036820"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/100/artifacts/eks-a/v0.22.6/darwin/amd64/eksctl-anywhere-v0.22.6-darwin-amd64.tar.gz"
    sha256 "840a55553efe419540f9406097b18e889aa86c51b444bcb808af79f900de613f"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/100/artifacts/eks-a/v0.22.6/linux/arm64/eksctl-anywhere-v0.22.6-linux-arm64.tar.gz"
    sha256 "0fba6d94b128ba5e7f5fb1cbd35d42fe311ed1f87b9d9c6d61b1075dc39822c7"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/100/artifacts/eks-a/v0.22.6/linux/amd64/eksctl-anywhere-v0.22.6-linux-amd64.tar.gz"
    sha256 "aebea9bf00f6057e86fca18037b5f5c8fedb4c970168be46fde39dc1669d70b5"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end