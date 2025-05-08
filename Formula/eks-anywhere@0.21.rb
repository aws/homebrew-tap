class EksAnywhereAT021 < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.21.8"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/98/artifacts/eks-a/v0.21.8/darwin/arm64/eksctl-anywhere-v0.21.8-darwin-arm64.tar.gz"
    sha256 "6f0cb372d502b37113cc601bd363636c30f5068aabe7026ac53b59edb25e884e"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/98/artifacts/eks-a/v0.21.8/darwin/amd64/eksctl-anywhere-v0.21.8-darwin-amd64.tar.gz"
    sha256 "abcf02e6a0166c2e125c31c29e4a5b47129926d7042081164bedca1bf2f95022"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/98/artifacts/eks-a/v0.21.8/linux/arm64/eksctl-anywhere-v0.21.8-linux-arm64.tar.gz"
    sha256 "4177bee9c0494a09f1db4cb793b0a2549d6c96ee851d81f6a4219282f11b778e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/98/artifacts/eks-a/v0.21.8/linux/amd64/eksctl-anywhere-v0.21.8-linux-amd64.tar.gz"
    sha256 "fb74235ec053b52b2beb054c4140ca5a4a5bf8b32c2fd13b02bb86060336fd73"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end