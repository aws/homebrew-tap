class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.25.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/120/artifacts/eks-a/v0.25.2/darwin/arm64/eksctl-anywhere-v0.25.2-darwin-arm64.tar.gz"
    sha256 "1a7620809b2a3e02de16792bda59055203d3cf42fbed12d5333f46b613e09bcc"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/120/artifacts/eks-a/v0.25.2/darwin/amd64/eksctl-anywhere-v0.25.2-darwin-amd64.tar.gz"
    sha256 "2f1c08522dcd2df16357124b87ba40f5b1e28f8fabe314840f6c4dd1c053cf48"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/120/artifacts/eks-a/v0.25.2/linux/arm64/eksctl-anywhere-v0.25.2-linux-arm64.tar.gz"
    sha256 "fd7b8f1b54ea8fe912f9bb1e376f6a8afc829fe65cc7df32b0b738eae92a149d"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/120/artifacts/eks-a/v0.25.2/linux/amd64/eksctl-anywhere-v0.25.2-linux-amd64.tar.gz"
    sha256 "65b3ef3257bc4f1c7f738c93c8caa8e42d8d64efdf88836518220c2d2d472e66"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end