class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.20.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/71/artifacts/eks-a/v0.20.2/darwin/arm64/eksctl-anywhere-v0.20.2-darwin-arm64.tar.gz"
    sha256 "9c196ecc2abd2cd105d39c3c9d876a56af97aa16468e8693f93303149dd903c6"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/71/artifacts/eks-a/v0.20.2/darwin/amd64/eksctl-anywhere-v0.20.2-darwin-amd64.tar.gz"
    sha256 "cc89877010095689307ce506f4314248c02732236853ae3b7c53a2945734be5f"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/71/artifacts/eks-a/v0.20.2/linux/arm64/eksctl-anywhere-v0.20.2-linux-arm64.tar.gz"
    sha256 "84fe4a07daa3708a4a6be9e3243d744ecc346d9d17d556ec90fc528f0b1472e2"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/71/artifacts/eks-a/v0.20.2/linux/amd64/eksctl-anywhere-v0.20.2-linux-amd64.tar.gz"
    sha256 "3e8c38daad09c7864a3c4ff3b27aca7acb4d9fc054b4112cd274a2a73c92d2c6"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end