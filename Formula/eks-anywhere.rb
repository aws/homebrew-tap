class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.18.4"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/56/artifacts/eks-a/v0.18.4/darwin/arm64/eksctl-anywhere-v0.18.4-darwin-arm64.tar.gz"
    sha256 "22417f2fbb06e280eebc4dd35d1c52207f688c2d583df7af01ee2b3f8f0fee7c"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/56/artifacts/eks-a/v0.18.4/darwin/amd64/eksctl-anywhere-v0.18.4-darwin-amd64.tar.gz"
    sha256 "6cbf17bbe52eeb3f62d978d7fa5e0a1c4f146b5f909a55ba3efc3e538c16e0e5"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/56/artifacts/eks-a/v0.18.4/linux/arm64/eksctl-anywhere-v0.18.4-linux-arm64.tar.gz"
    sha256 "a594afb998ec61ebb5643ae3a79cf8bf9ad0917d4bb6722955bf12326ed51b4b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/56/artifacts/eks-a/v0.18.4/linux/amd64/eksctl-anywhere-v0.18.4-linux-amd64.tar.gz"
    sha256 "89371077855e5207b9c43d3c50c3373f9712f57534a666ef923b3c00eafe63fc"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end