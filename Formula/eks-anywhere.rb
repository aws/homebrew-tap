class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.20.4"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/74/artifacts/eks-a/v0.20.4/darwin/arm64/eksctl-anywhere-v0.20.4-darwin-arm64.tar.gz"
    sha256 "ba7f8b54b1fa7e464975cbcd05974a251f9b3a348a56f84b19650b6a8fb5f843"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/74/artifacts/eks-a/v0.20.4/darwin/amd64/eksctl-anywhere-v0.20.4-darwin-amd64.tar.gz"
    sha256 "54beebad408f422efc099e79e5d2ac70225331ba295befb852f06c1f3ea53925"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/74/artifacts/eks-a/v0.20.4/linux/arm64/eksctl-anywhere-v0.20.4-linux-arm64.tar.gz"
    sha256 "ebca116118874ffa56e91a85af2adb52475df450fac0f8b07069e9f9fb6213a6"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/74/artifacts/eks-a/v0.20.4/linux/amd64/eksctl-anywhere-v0.20.4-linux-amd64.tar.gz"
    sha256 "277df6313f4cbfdb29f8f422c6f5ae7f992d4e58054df868a83edf25bf21961d"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end