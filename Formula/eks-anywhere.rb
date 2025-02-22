class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.21.7"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/91/artifacts/eks-a/v0.21.7/darwin/arm64/eksctl-anywhere-v0.21.7-darwin-arm64.tar.gz"
    sha256 "d2480daeb069c561cb2deaaec7c665ce1916442a9cd4ba953bc01cac7da180dc"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/91/artifacts/eks-a/v0.21.7/darwin/amd64/eksctl-anywhere-v0.21.7-darwin-amd64.tar.gz"
    sha256 "60f626c34643dfef0fa67ce8526880e50198944d95b44fe00a55d295fbfd06d8"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/91/artifacts/eks-a/v0.21.7/linux/arm64/eksctl-anywhere-v0.21.7-linux-arm64.tar.gz"
    sha256 "1b58e6be4aa801b816de2efbb8d3829ef439000fa31184efc58eec7ec751ff83"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/91/artifacts/eks-a/v0.21.7/linux/amd64/eksctl-anywhere-v0.21.7-linux-amd64.tar.gz"
    sha256 "e32f0dc7b060a7ac6955f792f011dc72b82ff0f5652ae7a773b2daecdcec90c9"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end