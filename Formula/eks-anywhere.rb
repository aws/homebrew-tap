class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.17.0"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/45/artifacts/eks-a/v0.17.0/darwin/amd64/eksctl-anywhere-v0.17.0-darwin-amd64.tar.gz"
    sha256 "ef0b6bd31b34f11d9bc5c291add9f014be3292fd103397309cfb6a4ec1e39889"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/45/artifacts/eks-a/v0.17.0/linux/amd64/eksctl-anywhere-v0.17.0-linux-amd64.tar.gz"
    sha256 "aa8f77947cd9c8aff7c7d18589a472282dddab23441a9408e404cf421734cdd2"
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