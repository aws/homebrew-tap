class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.18.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/51/artifacts/eks-a/v0.18.1/darwin/arm64/eksctl-anywhere-v0.18.1-darwin-arm64.tar.gz"
    sha256 "8a7d5a42a42ad83043858e1a25578592c3c42211b977d5cd2bf110993cf531bd"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/51/artifacts/eks-a/v0.18.1/darwin/amd64/eksctl-anywhere-v0.18.1-darwin-amd64.tar.gz"
    sha256 "59c69a5c6e3082fb889191ea1fbf127722f5de7297b32b68a8969d52de4ac1b6"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/51/artifacts/eks-a/v0.18.1/linux/arm64/eksctl-anywhere-v0.18.1-linux-arm64.tar.gz"
    sha256 "e90d205a9ba445d67b70d2681e590c15636dd799c4b46b30082c77e02d1e9a81"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/51/artifacts/eks-a/v0.18.1/linux/amd64/eksctl-anywhere-v0.18.1-linux-amd64.tar.gz"
    sha256 "c802152859bbe096989d426560b1aead9aa109282649e90b1ae34083e0f07a71"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end