class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.24.3"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/113/artifacts/eks-a/v0.24.3/darwin/arm64/eksctl-anywhere-v0.24.3-darwin-arm64.tar.gz"
    sha256 "67932836a19320e5cafb07659fd2b076a0a5e1949261b86f15eb0ec9b544a5ed"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/113/artifacts/eks-a/v0.24.3/darwin/amd64/eksctl-anywhere-v0.24.3-darwin-amd64.tar.gz"
    sha256 "8bcb55c3c8d9a60504cc40f601230bb9a79fc3b007b0b427f7d5a82485a277e8"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/113/artifacts/eks-a/v0.24.3/linux/arm64/eksctl-anywhere-v0.24.3-linux-arm64.tar.gz"
    sha256 "ae6cee1b3f222520b7646d54b60acc123bcfe72914c7130c5e95240c1c66fcae"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/113/artifacts/eks-a/v0.24.3/linux/amd64/eksctl-anywhere-v0.24.3-linux-amd64.tar.gz"
    sha256 "9f89bd6fb3bb2ca3f647d3dbdcf9b1264667bab58d80b9de3c965c33da1cc811"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end