class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.20.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/69/artifacts/eks-a/v0.20.1/darwin/arm64/eksctl-anywhere-v0.20.1-darwin-arm64.tar.gz"
    sha256 "e2b753281aa103f35a9c3ee46807e1cc65746d3737f305cd241d5374f4668d39"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/69/artifacts/eks-a/v0.20.1/darwin/amd64/eksctl-anywhere-v0.20.1-darwin-amd64.tar.gz"
    sha256 "6d1b4d1893808b37dec5faef30cb09ff54ce8f0ce50c6e9443eb2277b8723a7c"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/69/artifacts/eks-a/v0.20.1/linux/arm64/eksctl-anywhere-v0.20.1-linux-arm64.tar.gz"
    sha256 "72d318cc69c3c40c3513e43e279c36de6a92a82cc46e7fba5eca9bf4ff0a009f"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/69/artifacts/eks-a/v0.20.1/linux/amd64/eksctl-anywhere-v0.20.1-linux-amd64.tar.gz"
    sha256 "92d8410b469620311c9e8560a5aec0add5a73ec2c0ca9d9ecb3b7d2e2b1ab4b2"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end