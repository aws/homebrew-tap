class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.7.2"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/7/artifacts/eks-a/v0.7.2/darwin/amd64/eksctl-anywhere-v0.7.2-darwin-amd64.tar.gz"
    sha256 "f1f7e06ecdb5320d8842d42bac0a65a53602f64c163ad7288d8672494809e017"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/7/artifacts/eks-a/v0.7.2/linux/amd64/eksctl-anywhere-v0.7.2-linux-amd64.tar.gz"
    sha256 "561cb2621a1aced5ef09b6c2f28ea9c1dd3bac8dd08e5c6944d1e339ee5b92f9"
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
