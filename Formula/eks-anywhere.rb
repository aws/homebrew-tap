class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.24.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/110/artifacts/eks-a/v0.24.1/darwin/arm64/eksctl-anywhere-v0.24.1-darwin-arm64.tar.gz"
    sha256 "fc730c9f2534bfb87b58d4b7b067a7c82348b6f7246647675649944aa7d303c8"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/110/artifacts/eks-a/v0.24.1/darwin/amd64/eksctl-anywhere-v0.24.1-darwin-amd64.tar.gz"
    sha256 "10271c617330497a59b208622fa62645bca53d1c9d6d3282331e3c2ff92ec523"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/110/artifacts/eks-a/v0.24.1/linux/arm64/eksctl-anywhere-v0.24.1-linux-arm64.tar.gz"
    sha256 "09130385cb4a1e5866a43e2f5f2be33aadf15976bcab2fac162855a2d7bf5d87"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/110/artifacts/eks-a/v0.24.1/linux/amd64/eksctl-anywhere-v0.24.1-linux-amd64.tar.gz"
    sha256 "6412ea2f4d88d43e12aeaf9a9cb7fd603569fab2906ed22201c5300789da624b"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end