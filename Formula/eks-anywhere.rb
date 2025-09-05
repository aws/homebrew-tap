class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.23.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/104/artifacts/eks-a/v0.23.2/darwin/arm64/eksctl-anywhere-v0.23.2-darwin-arm64.tar.gz"
    sha256 "74fdc6c550eb8259b029e86672d35db0f9132f48841d7a3cd65bcee4c8ff861f"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/104/artifacts/eks-a/v0.23.2/darwin/amd64/eksctl-anywhere-v0.23.2-darwin-amd64.tar.gz"
    sha256 "ec5972f5ab3786b7cf31bfd33f7955eefac03f9a1b0e3c78e20b482718384232"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/104/artifacts/eks-a/v0.23.2/linux/arm64/eksctl-anywhere-v0.23.2-linux-arm64.tar.gz"
    sha256 "8ab9093300ac50fd99f980695fbf1d5d1a075c4af5b91345310e88c494e7f769"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/104/artifacts/eks-a/v0.23.2/linux/amd64/eksctl-anywhere-v0.23.2-linux-amd64.tar.gz"
    sha256 "342cdee5537f12630804055510409a54fb82acd8a998d853c80e93cf3888bd26"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end