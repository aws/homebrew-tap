class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.21.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/83/artifacts/eks-a/v0.21.1/darwin/arm64/eksctl-anywhere-v0.21.1-darwin-arm64.tar.gz"
    sha256 "f5442113c64c71d9899331f48f3b388455918feaaeeae9a8479a3c539491950e"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/83/artifacts/eks-a/v0.21.1/darwin/amd64/eksctl-anywhere-v0.21.1-darwin-amd64.tar.gz"
    sha256 "870411b41cc91bc560e9f36821d705b30b75fb5b10d05a40f715b51dbd76f02b"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/83/artifacts/eks-a/v0.21.1/linux/arm64/eksctl-anywhere-v0.21.1-linux-arm64.tar.gz"
    sha256 "e1582d136d949a2d2a5cb77d35d2830c6a7fd8f60408fba9e99d15504c984d24"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/83/artifacts/eks-a/v0.21.1/linux/amd64/eksctl-anywhere-v0.21.1-linux-amd64.tar.gz"
    sha256 "2137e61c6a2c74f18bb9e404c99424f0a28d011dcb92e6d410b4203b5d882caa"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end