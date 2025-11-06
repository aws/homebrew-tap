class EksAnywhereAT023 < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.23.5"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/109/artifacts/eks-a/v0.23.5/darwin/arm64/eksctl-anywhere-v0.23.5-darwin-arm64.tar.gz"
    sha256 "37c0badb3223f96b8b82e2b9b2185da331f8bbf7208ae18831f4cdfe2d1075bc"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/109/artifacts/eks-a/v0.23.5/darwin/amd64/eksctl-anywhere-v0.23.5-darwin-amd64.tar.gz"
    sha256 "a4b2c0eccbefdd4b6e3e3e1a1875f72b3a694d0125df96f203f984c75e5197c8"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/109/artifacts/eks-a/v0.23.5/linux/arm64/eksctl-anywhere-v0.23.5-linux-arm64.tar.gz"
    sha256 "2f08ef46310ba08eae096aa06b081d70326e134884a6ab9d273d094ad4c24f75"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/109/artifacts/eks-a/v0.23.5/linux/amd64/eksctl-anywhere-v0.23.5-linux-amd64.tar.gz"
    sha256 "7777187c9f1fceeee98d12b604a264a59e53ad0ab0583de3d8cc707fbb3f5363"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end