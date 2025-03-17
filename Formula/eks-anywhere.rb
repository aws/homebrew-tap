class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.22.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/93/artifacts/eks-a/v0.22.1/darwin/arm64/eksctl-anywhere-v0.22.1-darwin-arm64.tar.gz"
    sha256 "084f8bb7360ee46e67d5c0272aee561b314ca91b4111b2b54633a8eb0ec31c24"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/93/artifacts/eks-a/v0.22.1/darwin/amd64/eksctl-anywhere-v0.22.1-darwin-amd64.tar.gz"
    sha256 "c44be30dd9f897d7038619851c9bdebafb0b683a7f49282c99d7073202d45936"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/93/artifacts/eks-a/v0.22.1/linux/arm64/eksctl-anywhere-v0.22.1-linux-arm64.tar.gz"
    sha256 "f24efa223abfd6167e33509a8d6f23ba6ace1b56e210df65083b70c7cb675152"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/93/artifacts/eks-a/v0.22.1/linux/amd64/eksctl-anywhere-v0.22.1-linux-amd64.tar.gz"
    sha256 "7ccb5f805813c452cabbf4421313c0bcda2bc4b025d90f6dca73fbcee4af9ccd"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end