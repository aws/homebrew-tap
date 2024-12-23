class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.21.3"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/86/artifacts/eks-a/v0.21.3/darwin/arm64/eksctl-anywhere-v0.21.3-darwin-arm64.tar.gz"
    sha256 "c3f9468dca124d610802dde59e8fe918d4ea27a5a6e3401676d45e10b882a381"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/86/artifacts/eks-a/v0.21.3/darwin/amd64/eksctl-anywhere-v0.21.3-darwin-amd64.tar.gz"
    sha256 "ca1c1a6781ead5ff3bbf35464b42b16f2eede55f23a4f15c5fa560f079fd0535"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/86/artifacts/eks-a/v0.21.3/linux/arm64/eksctl-anywhere-v0.21.3-linux-arm64.tar.gz"
    sha256 "a15242d22117eb9f68ee3192c0dc1240e14e5cba209592d446d8b67f4076b045"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/86/artifacts/eks-a/v0.21.3/linux/amd64/eksctl-anywhere-v0.21.3-linux-amd64.tar.gz"
    sha256 "fe66a3611bd2020a90aa8a85e4086674e63dc1029f65300698c963066f7ccf8b"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end