class EksAnywhereAT019 < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.19.11"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/79/artifacts/eks-a/v0.19.11/darwin/arm64/eksctl-anywhere-v0.19.11-darwin-arm64.tar.gz"
    sha256 "6cb8ff390a343ce3db941f131a26f5ab1b86a6419949e759c23b46ae5df6d9d0"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/79/artifacts/eks-a/v0.19.11/darwin/amd64/eksctl-anywhere-v0.19.11-darwin-amd64.tar.gz"
    sha256 "82ed0aec9d9235baa9987868c6399a4c4d51a2bc9c80637efb181baa47a5d61a"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/79/artifacts/eks-a/v0.19.11/linux/arm64/eksctl-anywhere-v0.19.11-linux-arm64.tar.gz"
    sha256 "fe3a121d12a7d7d3063f932e29b07a87a767ca3e8902d01639479e2600455d37"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/79/artifacts/eks-a/v0.19.11/linux/amd64/eksctl-anywhere-v0.19.11-linux-amd64.tar.gz"
    sha256 "82fe578d94bc60874b51ecff45d21e4539bea25a880a978c5de2cd690ce0b39c"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end