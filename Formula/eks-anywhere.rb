class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.15.2"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/36/artifacts/eks-a/v0.15.2/darwin/amd64/eksctl-anywhere-v0.15.2-darwin-amd64.tar.gz"
    sha256 "737802dfd090372dee216025ced3afa88ca031dc8b1d05bbda6a718f127b41fa"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/36/artifacts/eks-a/v0.15.2/linux/amd64/eksctl-anywhere-v0.15.2-linux-amd64.tar.gz"
    sha256 "86fa1123623cea947e157e0429fc929a45916362858aa7ed826a23b7dc9b3815"
  end

  if Hardware::CPU.arm?
    def caveats
      <<~EOF
          =====WARNING=====
          ARM CPU's are not yet supported.
          The amd64 binary has been installed but will not work.
          Please uninstall this formula.
      EOF
    end
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end