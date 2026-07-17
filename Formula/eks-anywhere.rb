class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.26.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/122/artifacts/eks-a/v0.26.0/darwin/arm64/eksctl-anywhere-v0.26.0-darwin-arm64.tar.gz"
    sha256 "c59a07cc7d1f1b9faef85fb9fa87214d3edff91204d001b057b17966c5c9fc01"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/122/artifacts/eks-a/v0.26.0/darwin/amd64/eksctl-anywhere-v0.26.0-darwin-amd64.tar.gz"
    sha256 "afb5a7829ce56eb322885b4821cfbacce995d6131c03bdfa9cbc906457216965"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/122/artifacts/eks-a/v0.26.0/linux/arm64/eksctl-anywhere-v0.26.0-linux-arm64.tar.gz"
    sha256 "25732592968b9db3c3d86100c238c1fe636c293e484819072b4430e2671397ba"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/122/artifacts/eks-a/v0.26.0/linux/amd64/eksctl-anywhere-v0.26.0-linux-amd64.tar.gz"
    sha256 "9702714deeeef89dc086b4ab88241f900d4f7b69eeb626004daabab69bbe7cbf"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end