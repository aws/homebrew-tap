class EksAnywhereAT020 < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.20.10"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/85/artifacts/eks-a/v0.20.10/darwin/arm64/eksctl-anywhere-v0.20.10-darwin-arm64.tar.gz"
    sha256 "dee43e0483535c94e358115086984b6791fa4d25ac2d0b97555cabe1fddb054b"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/85/artifacts/eks-a/v0.20.10/darwin/amd64/eksctl-anywhere-v0.20.10-darwin-amd64.tar.gz"
    sha256 "1047b95a734d9f422f15b52187744d577f54651c4c582b3b151ef28e127ad327"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/85/artifacts/eks-a/v0.20.10/linux/arm64/eksctl-anywhere-v0.20.10-linux-arm64.tar.gz"
    sha256 "84cf19c02844f89ba46efccb566e3384e430ca849d9791555b70010ce6188e7e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/85/artifacts/eks-a/v0.20.10/linux/amd64/eksctl-anywhere-v0.20.10-linux-amd64.tar.gz"
    sha256 "132bff912e7a64139a24fb621c7b6a49cfbc346861bdcda0e856f503118df54f"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end