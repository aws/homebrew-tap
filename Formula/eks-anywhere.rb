class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.16.1"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/40/artifacts/eks-a/v0.16.1/darwin/amd64/eksctl-anywhere-v0.16.1-darwin-amd64.tar.gz"
    sha256 "2cde72a01c51379c1e6da11ee3d1a874d99849160031db9a3d9fb259d5e1eedd"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/40/artifacts/eks-a/v0.16.1/linux/amd64/eksctl-anywhere-v0.16.1-linux-amd64.tar.gz"
    sha256 "d7fcce17664fc89b6fe2306b13ec2f3e636cbfadc4006a9b869bb22241cc0cca"
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