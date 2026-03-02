class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.25.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/116/artifacts/eks-a/v0.25.0/darwin/arm64/eksctl-anywhere-v0.25.0-darwin-arm64.tar.gz"
    sha256 "64dbb645fae9a03ae1fe3484f0d68ad93943d8e910230d29c76476af45555130"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/116/artifacts/eks-a/v0.25.0/darwin/amd64/eksctl-anywhere-v0.25.0-darwin-amd64.tar.gz"
    sha256 "6cc7d5f8cb9242e0c5d3137a33e1f0bc3e8dfaed645e7ba8a28270a60800db03"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/116/artifacts/eks-a/v0.25.0/linux/arm64/eksctl-anywhere-v0.25.0-linux-arm64.tar.gz"
    sha256 "35a39cee9faad90c440da917e6942426ff9991251991f850feab7043bf5b791b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/116/artifacts/eks-a/v0.25.0/linux/amd64/eksctl-anywhere-v0.25.0-linux-amd64.tar.gz"
    sha256 "a8620d5d1270fb98dacce400cb2462e3b29e1c0d7b00b9425991a593a938654c"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end