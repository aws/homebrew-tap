class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.18.6"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/58/artifacts/eks-a/v0.18.6/darwin/arm64/eksctl-anywhere-v0.18.6-darwin-arm64.tar.gz"
    sha256 "b2a04e07b8851ec50eb5574255f16f439e956dba64da51e1899a80831cfee493"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/58/artifacts/eks-a/v0.18.6/darwin/amd64/eksctl-anywhere-v0.18.6-darwin-amd64.tar.gz"
    sha256 "e001935855c2694c9778decc85973dbbdf5ace58c6265f252718fcc56ace9a2a"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/58/artifacts/eks-a/v0.18.6/linux/arm64/eksctl-anywhere-v0.18.6-linux-arm64.tar.gz"
    sha256 "e991345c8afa7c51c7796d3e842a4078054c75e0edd9f33a419724e0cd4b67c6"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/58/artifacts/eks-a/v0.18.6/linux/amd64/eksctl-anywhere-v0.18.6-linux-amd64.tar.gz"
    sha256 "85333fc0749a9605b6595f45c42bb2a96a918928b0c7ab4af724ed13e028b5e2"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end