class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.20.3"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/72/artifacts/eks-a/v0.20.3/darwin/arm64/eksctl-anywhere-v0.20.3-darwin-arm64.tar.gz"
    sha256 "3778f0d1197571336e0486a694f6c2a3cf36c51a995fd79a51fd99418167f4e7"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/72/artifacts/eks-a/v0.20.3/darwin/amd64/eksctl-anywhere-v0.20.3-darwin-amd64.tar.gz"
    sha256 "d5bb3745b2a56ce0902eebc8a24d1db96520e6fbf2fe802fa3304444bd184751"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/72/artifacts/eks-a/v0.20.3/linux/arm64/eksctl-anywhere-v0.20.3-linux-arm64.tar.gz"
    sha256 "e33b73e8beed08d00e825db508e8946352077ba36421f968cab7349f3806b94a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/72/artifacts/eks-a/v0.20.3/linux/amd64/eksctl-anywhere-v0.20.3-linux-amd64.tar.gz"
    sha256 "49cbf8c1010c188fd4434aecb3e628d9e23dbf2d039668eb3f02ddacde55c788"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end