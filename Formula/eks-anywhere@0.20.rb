class EksAnywhereAT020 < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.20.9"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/82/artifacts/eks-a/v0.20.9/darwin/arm64/eksctl-anywhere-v0.20.9-darwin-arm64.tar.gz"
    sha256 "bcbb6e16a8fc49f78f20a37d6035adfa3a5a848afc6cb92734c4565209b26785"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/82/artifacts/eks-a/v0.20.9/darwin/amd64/eksctl-anywhere-v0.20.9-darwin-amd64.tar.gz"
    sha256 "4cb1abfd81c9ed4e80fcea8206f9febee87c20df8e8a2bc5cc3fcb24088ece22"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/82/artifacts/eks-a/v0.20.9/linux/arm64/eksctl-anywhere-v0.20.9-linux-arm64.tar.gz"
    sha256 "efec318725dd7eaa5979be855eacae9f8084df3746891a9c09e8115ec257ed81"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/82/artifacts/eks-a/v0.20.9/linux/amd64/eksctl-anywhere-v0.20.9-linux-amd64.tar.gz"
    sha256 "b56e18ee8ab9c90c49c5d18ba11aa65b04e39aafae58568c29e1804cdc1bdff7"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end