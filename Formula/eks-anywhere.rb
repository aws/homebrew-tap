class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.19.6"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/66/artifacts/eks-a/v0.19.6/darwin/arm64/eksctl-anywhere-v0.19.6-darwin-arm64.tar.gz"
    sha256 "bae0fd64d21f6f275b456bd24eb9088cff6a69c9499b2041b68928bceaa4c83b"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/66/artifacts/eks-a/v0.19.6/darwin/amd64/eksctl-anywhere-v0.19.6-darwin-amd64.tar.gz"
    sha256 "8ed8c13d869ef7355f39182cb32a22deb3bddd91ad0e2523d092f89d273d968a"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/66/artifacts/eks-a/v0.19.6/linux/arm64/eksctl-anywhere-v0.19.6-linux-arm64.tar.gz"
    sha256 "c34b9a20a98e086f5a15e78a061497b6040d387048d154f641b5207d3e882659"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/66/artifacts/eks-a/v0.19.6/linux/amd64/eksctl-anywhere-v0.19.6-linux-amd64.tar.gz"
    sha256 "d8924e23b301ed7132739d07ea7f0c582cb23bc09dd59e3c575f55ea09aca265"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end