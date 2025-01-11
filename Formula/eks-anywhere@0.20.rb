class EksAnywhereAT020 < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.20.11"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/88/artifacts/eks-a/v0.20.11/darwin/arm64/eksctl-anywhere-v0.20.11-darwin-arm64.tar.gz"
    sha256 "a45ccb1fa8a2abe1b3916ad5d2cce5348d058779a507799e60a8db4d5203590c"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/88/artifacts/eks-a/v0.20.11/darwin/amd64/eksctl-anywhere-v0.20.11-darwin-amd64.tar.gz"
    sha256 "f98e3fd21bb57f12a026954b1c9e321073ba8ac7981fd7fa8fc5ead4f18d42c3"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/88/artifacts/eks-a/v0.20.11/linux/arm64/eksctl-anywhere-v0.20.11-linux-arm64.tar.gz"
    sha256 "f9d439f8736ef5a7bb72d1efd67363fa7967f1d2345d6f26c58908971b6e9ff9"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/88/artifacts/eks-a/v0.20.11/linux/amd64/eksctl-anywhere-v0.20.11-linux-amd64.tar.gz"
    sha256 "21c56d745ccb4a1de341ff8240e60c7c50ca1fc03762ae68fb2c2c44f6e1f309"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end