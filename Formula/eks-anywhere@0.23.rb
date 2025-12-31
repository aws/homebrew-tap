class EksAnywhereAT023 < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.23.6"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/112/artifacts/eks-a/v0.23.6/darwin/arm64/eksctl-anywhere-v0.23.6-darwin-arm64.tar.gz"
    sha256 "ee42eebb3a0f1ecc86d52f226c718c592b06ca5906213828bc39d1f6f2cf021d"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/112/artifacts/eks-a/v0.23.6/darwin/amd64/eksctl-anywhere-v0.23.6-darwin-amd64.tar.gz"
    sha256 "8541f6e90b42b98c0ebe017a0b30e60de08363cb71693e8cfa6aa8c65c6420a6"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/112/artifacts/eks-a/v0.23.6/linux/arm64/eksctl-anywhere-v0.23.6-linux-arm64.tar.gz"
    sha256 "9cff63a23042f229c4ea4ac9dd56bfc81439c23090a18612f0e8fe2b52656c44"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/112/artifacts/eks-a/v0.23.6/linux/amd64/eksctl-anywhere-v0.23.6-linux-amd64.tar.gz"
    sha256 "aa756015e9ab28176f268612a8c04aa505bac2a62d6834cb5fcaf63aa155dfc4"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end