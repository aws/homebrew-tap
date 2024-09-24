class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.20.6"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/77/artifacts/eks-a/v0.20.6/darwin/arm64/eksctl-anywhere-v0.20.6-darwin-arm64.tar.gz"
    sha256 "4465bfc23d11f65904e6be02c532b0b384355ad06373defc590aeb26a0f2c568"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/77/artifacts/eks-a/v0.20.6/darwin/amd64/eksctl-anywhere-v0.20.6-darwin-amd64.tar.gz"
    sha256 "c7c759c6e92ad396109e32b60242c7f252f3da16067199a7266be0acff241b81"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/77/artifacts/eks-a/v0.20.6/linux/arm64/eksctl-anywhere-v0.20.6-linux-arm64.tar.gz"
    sha256 "29728b02b6c41e4f9624c99b82c9ba9bbb93b8f45fb7f812eb0b18bb6759efa8"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/77/artifacts/eks-a/v0.20.6/linux/amd64/eksctl-anywhere-v0.20.6-linux-amd64.tar.gz"
    sha256 "61b41e788859f847f0e8d995327f6c3047645945976acbcca69348f09402be76"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end