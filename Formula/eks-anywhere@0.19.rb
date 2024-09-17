class EksAnywhereAT019 < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.19.10"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/76/artifacts/eks-a/v0.19.10/darwin/arm64/eksctl-anywhere-v0.19.10-darwin-arm64.tar.gz"
    sha256 "82a3460a42f5d0b424bd06042eb5d5b6098e8747777744f7f2f4e4c258226cb1"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/76/artifacts/eks-a/v0.19.10/darwin/amd64/eksctl-anywhere-v0.19.10-darwin-amd64.tar.gz"
    sha256 "ed364c5a40f42a999dba03e306fe07fe4cab7896ee71fc7dd636503533eb5ea9"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/76/artifacts/eks-a/v0.19.10/linux/arm64/eksctl-anywhere-v0.19.10-linux-arm64.tar.gz"
    sha256 "3668dc65e24c81919e1be13406e313f0fa97ee73aea91fc1f28a89ba145f09c5"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/76/artifacts/eks-a/v0.19.10/linux/amd64/eksctl-anywhere-v0.19.10-linux-amd64.tar.gz"
    sha256 "b56407aa54a04280e1f064a63613f90802d519917cd8c1c30c2a3d078e96549f"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end