class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.22.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/95/artifacts/eks-a/v0.22.2/darwin/arm64/eksctl-anywhere-v0.22.2-darwin-arm64.tar.gz"
    sha256 "ef45c165cbfc024a315da755241907aaaa6455632cb0da42c99bf519d2752b99"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/95/artifacts/eks-a/v0.22.2/darwin/amd64/eksctl-anywhere-v0.22.2-darwin-amd64.tar.gz"
    sha256 "2a75e9a1750fac1a67b07d66fe61cd4acf488592d5c2f6fcd7e4c7993c882b6a"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/95/artifacts/eks-a/v0.22.2/linux/arm64/eksctl-anywhere-v0.22.2-linux-arm64.tar.gz"
    sha256 "8fc565e987be9a204cd18c98a368c8351988129a197f80b028a5b25d351b9427"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/95/artifacts/eks-a/v0.22.2/linux/amd64/eksctl-anywhere-v0.22.2-linux-amd64.tar.gz"
    sha256 "a46f5491fdd2399d0cc2312b1cc8359ddb0af39ba7a78f4828c62cfec1fd996c"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end