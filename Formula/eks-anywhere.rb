class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.22.3"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/96/artifacts/eks-a/v0.22.3/darwin/arm64/eksctl-anywhere-v0.22.3-darwin-arm64.tar.gz"
    sha256 "dfd01feaa875bcbd22241f5698563c26cf047957b355015ac7061f8a88247c38"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/96/artifacts/eks-a/v0.22.3/darwin/amd64/eksctl-anywhere-v0.22.3-darwin-amd64.tar.gz"
    sha256 "a51479462f478148700984ea2c162269bc618290898611c4566ad61a7f716097"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/96/artifacts/eks-a/v0.22.3/linux/arm64/eksctl-anywhere-v0.22.3-linux-arm64.tar.gz"
    sha256 "82d8b3ecfd2cc71067e0f654c9d01ade42a2e0b13aeccac8a0ceb79e0932d382"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/96/artifacts/eks-a/v0.22.3/linux/amd64/eksctl-anywhere-v0.22.3-linux-amd64.tar.gz"
    sha256 "4043797c9986fb507cc6853d626b3dea9c6660d2ed99f7d053b92539de9d5d94"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end