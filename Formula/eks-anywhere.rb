class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.24.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/111/artifacts/eks-a/v0.24.2/darwin/arm64/eksctl-anywhere-v0.24.2-darwin-arm64.tar.gz"
    sha256 "c71aa5bbf5ca45afa0e8a1e6a24eb095b676c16f3e60ff098d608fc2dadecaf4"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/111/artifacts/eks-a/v0.24.2/darwin/amd64/eksctl-anywhere-v0.24.2-darwin-amd64.tar.gz"
    sha256 "c347e5e1f844b068df649537f9d3da15fb5127fc14afd6b6f5f0e5de61acf8e2"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/111/artifacts/eks-a/v0.24.2/linux/arm64/eksctl-anywhere-v0.24.2-linux-arm64.tar.gz"
    sha256 "f6871b9f4a442c03d6f20c38a44fc9a63182c174daafc673ebf84986a7669347"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/111/artifacts/eks-a/v0.24.2/linux/amd64/eksctl-anywhere-v0.24.2-linux-amd64.tar.gz"
    sha256 "73fc3fbf1e7a805aef6e0cc45dc938260f8c517d70db5a4ff97f4bcc71889d48"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end