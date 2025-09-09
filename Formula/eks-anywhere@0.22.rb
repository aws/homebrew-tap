class EksAnywhereAT022 < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.22.8"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/105/artifacts/eks-a/v0.22.8/darwin/arm64/eksctl-anywhere-v0.22.8-darwin-arm64.tar.gz"
    sha256 "15c72a8ee398f14af98a162e68ddaf6fece2fbb5bd685122fd91183baf4cf87f"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/105/artifacts/eks-a/v0.22.8/darwin/amd64/eksctl-anywhere-v0.22.8-darwin-amd64.tar.gz"
    sha256 "8b0208d2cd89ec2953ef0b41a60003a68e5476b17171bfc43fba82da72d9053c"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/105/artifacts/eks-a/v0.22.8/linux/arm64/eksctl-anywhere-v0.22.8-linux-arm64.tar.gz"
    sha256 "7ef86c830e5b3bf4e8b24685b8835867d6dd21f0b5fa5b4881b1a4d6528ac6e7"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/105/artifacts/eks-a/v0.22.8/linux/amd64/eksctl-anywhere-v0.22.8-linux-amd64.tar.gz"
    sha256 "f2b3f13534a705f3ec59bbf2bd0426ac98684be550a0a1ec512923b460b05590"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end