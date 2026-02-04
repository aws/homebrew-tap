class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.24.4"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/115/artifacts/eks-a/v0.24.4/darwin/arm64/eksctl-anywhere-v0.24.4-darwin-arm64.tar.gz"
    sha256 "cbd55e262c6f6604626d9d2de79ed6f589973a771565e407a48491ad3556676a"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/115/artifacts/eks-a/v0.24.4/darwin/amd64/eksctl-anywhere-v0.24.4-darwin-amd64.tar.gz"
    sha256 "091115374deb7ff476097fa1e02b4bbd68d84993e4262fc75b0cd741089c7f97"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/115/artifacts/eks-a/v0.24.4/linux/arm64/eksctl-anywhere-v0.24.4-linux-arm64.tar.gz"
    sha256 "8ab060ee9a6727e6c3fad05edde38a01ed52d5d46332a2c9dfc1248eaa687560"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/115/artifacts/eks-a/v0.24.4/linux/amd64/eksctl-anywhere-v0.24.4-linux-amd64.tar.gz"
    sha256 "c6bf36a8e545f07816c7ed9d7c6480fd4115181fe30006c086eeecbc21d3fed9"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end