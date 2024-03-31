class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.19.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/62/artifacts/eks-a/v0.19.2/darwin/arm64/eksctl-anywhere-v0.19.2-darwin-arm64.tar.gz"
    sha256 "b986535312a3d957c8d86fc57c519a12a8b85fd0a044c9ba6fc696f6d4d2e28c"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/62/artifacts/eks-a/v0.19.2/darwin/amd64/eksctl-anywhere-v0.19.2-darwin-amd64.tar.gz"
    sha256 "0def7950a500f10a95e1965cbc0e3603835d08de985b3b805cc43231121e29a5"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/62/artifacts/eks-a/v0.19.2/linux/arm64/eksctl-anywhere-v0.19.2-linux-arm64.tar.gz"
    sha256 "cf22dda915912d71a9631523f7358732be6d3f3d21808af23e91bb08a5359789"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/62/artifacts/eks-a/v0.19.2/linux/amd64/eksctl-anywhere-v0.19.2-linux-amd64.tar.gz"
    sha256 "86d55fe47603702ce0ac35ed8879849dc26caa0d9ec8f2b2434801d210b88f4e"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end