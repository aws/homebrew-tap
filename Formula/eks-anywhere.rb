class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.22.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/92/artifacts/eks-a/v0.22.0/darwin/arm64/eksctl-anywhere-v0.22.0-darwin-arm64.tar.gz"
    sha256 "2e69510dc5f743a7eed7f5ffcf6dc19d45aff22651f20cfacd9cf0abbdbedbb9"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/92/artifacts/eks-a/v0.22.0/darwin/amd64/eksctl-anywhere-v0.22.0-darwin-amd64.tar.gz"
    sha256 "4c74ea15dfdb8e92b14f0b0464f1bbee56cd4e7f4bb36bbcd497d0bfbb4f394e"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/92/artifacts/eks-a/v0.22.0/linux/arm64/eksctl-anywhere-v0.22.0-linux-arm64.tar.gz"
    sha256 "5e7df360b260ca9cf13986f106de4ed5770aa905eb125f0ddded7db64f559702"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/92/artifacts/eks-a/v0.22.0/linux/amd64/eksctl-anywhere-v0.22.0-linux-amd64.tar.gz"
    sha256 "3078a33e5cf074e7154590722b322eabd34a2615c6efa0980604c29c956035af"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end