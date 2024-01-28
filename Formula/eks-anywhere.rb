class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.18.5"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/57/artifacts/eks-a/v0.18.5/darwin/arm64/eksctl-anywhere-v0.18.5-darwin-arm64.tar.gz"
    sha256 "36bb0a6d704cf7027b93ebdf04ce860e4deabceb3e104366e0db3f97d511f943"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/57/artifacts/eks-a/v0.18.5/darwin/amd64/eksctl-anywhere-v0.18.5-darwin-amd64.tar.gz"
    sha256 "95bd59cfb562a0fad0f4426463f7451505422f00bfb7803c25b25db98d425dac"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/57/artifacts/eks-a/v0.18.5/linux/arm64/eksctl-anywhere-v0.18.5-linux-arm64.tar.gz"
    sha256 "34327ee6f34e8f168de651a061bdafbd1ed996a56b75d9b619f13df4bbca0383"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/57/artifacts/eks-a/v0.18.5/linux/amd64/eksctl-anywhere-v0.18.5-linux-amd64.tar.gz"
    sha256 "79e53311f6d61c77c2204818c55b77b5b3e563f2afe6fe63b9d6724d83283d8d"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end