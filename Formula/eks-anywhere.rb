class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.18.3"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/54/artifacts/eks-a/v0.18.3/darwin/arm64/eksctl-anywhere-v0.18.3-darwin-arm64.tar.gz"
    sha256 "682e171b76db869b2bb169c8213ee7ad950771e9574563c3ddf5b45915aa5aa5"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/54/artifacts/eks-a/v0.18.3/darwin/amd64/eksctl-anywhere-v0.18.3-darwin-amd64.tar.gz"
    sha256 "d7a647364f75cd3db685303faaf76d16fa32a0c5b6672b0adc36bfb23f6c607b"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/54/artifacts/eks-a/v0.18.3/linux/arm64/eksctl-anywhere-v0.18.3-linux-arm64.tar.gz"
    sha256 "a98c1b94b4eb4c5b10702c9c3fd2e4fc5f18e28f08aff7fa7f50af2fc4967aac"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/54/artifacts/eks-a/v0.18.3/linux/amd64/eksctl-anywhere-v0.18.3-linux-amd64.tar.gz"
    sha256 "0919100349cbe9cca81c4b8bf029761c97d4f88540b122bad2f718e086219f36"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end