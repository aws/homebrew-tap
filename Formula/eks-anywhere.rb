class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.20.8"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/80/artifacts/eks-a/v0.20.8/darwin/arm64/eksctl-anywhere-v0.20.8-darwin-arm64.tar.gz"
    sha256 "6eb7e340f9b71680623a58e7e298e26230aa4df2744db138a5c8d4519d6bf196"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/80/artifacts/eks-a/v0.20.8/darwin/amd64/eksctl-anywhere-v0.20.8-darwin-amd64.tar.gz"
    sha256 "10eed84d3a88d5a6b9eca13f80b700dd2dc94140d42ae96c09e9353f1afedf30"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/80/artifacts/eks-a/v0.20.8/linux/arm64/eksctl-anywhere-v0.20.8-linux-arm64.tar.gz"
    sha256 "8a7da170601688ae3d1b9483002fd4543d9be9addf759e9fa804ce2002247458"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/80/artifacts/eks-a/v0.20.8/linux/amd64/eksctl-anywhere-v0.20.8-linux-amd64.tar.gz"
    sha256 "5c3de79bd4b66054e1aa4a75090223c2c16a58824e73d3f35841cf29a37afc5a"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end