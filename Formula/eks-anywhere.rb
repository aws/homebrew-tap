class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.19.3"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/63/artifacts/eks-a/v0.19.3/darwin/arm64/eksctl-anywhere-v0.19.3-darwin-arm64.tar.gz"
    sha256 "ef31f55d0a255b0561ccf5e9a260d8c193ce30634cb0d48bb8f2df10d1f830a2"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/63/artifacts/eks-a/v0.19.3/darwin/amd64/eksctl-anywhere-v0.19.3-darwin-amd64.tar.gz"
    sha256 "8ab9733054f019456da7266115cef5e53613a34693136e501fd869d89f7eaab8"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/63/artifacts/eks-a/v0.19.3/linux/arm64/eksctl-anywhere-v0.19.3-linux-arm64.tar.gz"
    sha256 "253d9d89c2d80fe188f709d35d1ace06929a913b4f055d7611767a4654d78f21"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/63/artifacts/eks-a/v0.19.3/linux/amd64/eksctl-anywhere-v0.19.3-linux-amd64.tar.gz"
    sha256 "a643b1dc3575fc3a83b714443bb656cee805fbc24e8249dc5c91b778b7e2b88c"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end