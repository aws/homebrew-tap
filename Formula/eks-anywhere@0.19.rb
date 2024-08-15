class EksAnywhereAT019 < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.19.8"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/70/artifacts/eks-a/v0.19.8/darwin/arm64/eksctl-anywhere-v0.19.8-darwin-arm64.tar.gz"
    sha256 "517d94da2f74171573cc401df2befb54889abeee42f8a1556cc3ef568983b288"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/70/artifacts/eks-a/v0.19.8/darwin/amd64/eksctl-anywhere-v0.19.8-darwin-amd64.tar.gz"
    sha256 "61a7318bba2d0df61db9a0343bf726e42c39af14dc4bf769db465866cfc90288"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/70/artifacts/eks-a/v0.19.8/linux/arm64/eksctl-anywhere-v0.19.8-linux-arm64.tar.gz"
    sha256 "7cfdd785d9d4f01fda1b9a7a755b412d01e6dbb01df1fc58ecabcdecdc222ab1"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/70/artifacts/eks-a/v0.19.8/linux/amd64/eksctl-anywhere-v0.19.8-linux-amd64.tar.gz"
    sha256 "752e8fbd13ab7e10751ec6b7c9e2e8be1df3f07e094c942c1b4431e544f02930"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end