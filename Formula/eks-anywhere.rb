class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.8.2"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/10/artifacts/eks-a/v0.8.2/darwin/amd64/eksctl-anywhere-v0.8.2-darwin-amd64.tar.gz"
    sha256 "46c58a364f90ebda4e8e89739468cafad26c5f34d02af93339bd6957a021d547"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/10/artifacts/eks-a/v0.8.2/linux/amd64/eksctl-anywhere-v0.8.2-linux-amd64.tar.gz"
    sha256 "81378b7adfc3b71091464688b3c09afc25e279f6439ca8c025795c5469e61793"
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