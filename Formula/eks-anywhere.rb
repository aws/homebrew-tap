class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.21.5"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/89/artifacts/eks-a/v0.21.5/darwin/arm64/eksctl-anywhere-v0.21.5-darwin-arm64.tar.gz"
    sha256 "b04c492de5e41f4f44f7d3df0449e608650a9970c46c794c99450c4fe9261fa2"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/89/artifacts/eks-a/v0.21.5/darwin/amd64/eksctl-anywhere-v0.21.5-darwin-amd64.tar.gz"
    sha256 "bcb17e6c1f12823a0f9659ea796525b18ab6ab891a0acee1cf44671aa40e061e"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/89/artifacts/eks-a/v0.21.5/linux/arm64/eksctl-anywhere-v0.21.5-linux-arm64.tar.gz"
    sha256 "49ab8c146c625e6b8714b682b76d136740d27af0ced6c61ebd3c3bb641c1055f"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/89/artifacts/eks-a/v0.21.5/linux/amd64/eksctl-anywhere-v0.21.5-linux-amd64.tar.gz"
    sha256 "3f7b802795c6c86843898e6700fc1d754b670cb89aa22898bd067794df1175be"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end