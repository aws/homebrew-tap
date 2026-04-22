class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.25.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/118/artifacts/eks-a/v0.25.1/darwin/arm64/eksctl-anywhere-v0.25.1-darwin-arm64.tar.gz"
    sha256 "13fecf5aaea2a919b2ff0cec99ab10a55c96b8e63647889026f32ba670505de3"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/118/artifacts/eks-a/v0.25.1/darwin/amd64/eksctl-anywhere-v0.25.1-darwin-amd64.tar.gz"
    sha256 "1af694dfaa5d1683e1e0d554701e8d98c8f345d49e740ac5a07e173235dba133"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/118/artifacts/eks-a/v0.25.1/linux/arm64/eksctl-anywhere-v0.25.1-linux-arm64.tar.gz"
    sha256 "eb2d9e21deb2b639f681f2fb0573d66033e7c6eaa060773665cfb5c8b09c612c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/118/artifacts/eks-a/v0.25.1/linux/amd64/eksctl-anywhere-v0.25.1-linux-amd64.tar.gz"
    sha256 "578255836e1418aaff08a91db3c39efc15e9f4c4cba3d5fb8e6d03d761451d4f"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end