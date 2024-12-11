class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.21.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/84/artifacts/eks-a/v0.21.2/darwin/arm64/eksctl-anywhere-v0.21.2-darwin-arm64.tar.gz"
    sha256 "ac4ba40f3e79333d08ba119e523978ab02998e305ed2fe51e937c8f02324ce23"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/84/artifacts/eks-a/v0.21.2/darwin/amd64/eksctl-anywhere-v0.21.2-darwin-amd64.tar.gz"
    sha256 "bfc93ae251203295ed694a86e1b25794fedd6b34f45a27e176111e9fa58b56a8"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/84/artifacts/eks-a/v0.21.2/linux/arm64/eksctl-anywhere-v0.21.2-linux-arm64.tar.gz"
    sha256 "9fe983195bb3554209cb2e74f219177ee93a048e470ff64d43fef0650c786652"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/84/artifacts/eks-a/v0.21.2/linux/amd64/eksctl-anywhere-v0.21.2-linux-amd64.tar.gz"
    sha256 "6efa7468adb26bc9ae1e4d9ac11569fd0ee2b3c245ee923eec2046ceec832193"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end