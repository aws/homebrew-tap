class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.21.4"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/87/artifacts/eks-a/v0.21.4/darwin/arm64/eksctl-anywhere-v0.21.4-darwin-arm64.tar.gz"
    sha256 "27d3a3587d642bed72c498efab8966e0d0a08e3be69eab473728b6773bfb5621"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/87/artifacts/eks-a/v0.21.4/darwin/amd64/eksctl-anywhere-v0.21.4-darwin-amd64.tar.gz"
    sha256 "9b9cd8bfe6b18532359589044e6624159919ee160088945fc3e2708cee9c6f45"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/87/artifacts/eks-a/v0.21.4/linux/arm64/eksctl-anywhere-v0.21.4-linux-arm64.tar.gz"
    sha256 "28b4dfb2efef94900e8d9ea4df856648195dcb188f8215a78a39c2e68cb566c4"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/87/artifacts/eks-a/v0.21.4/linux/amd64/eksctl-anywhere-v0.21.4-linux-amd64.tar.gz"
    sha256 "0a1a84f9b2dd5fc69b7534105be0f494f3c14796fb12943281992292b56ba79a"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end
