class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.12.0"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/22/artifacts/eks-a/v0.12.0/darwin/amd64/eksctl-anywhere-v0.12.0-darwin-amd64.tar.gz"
    sha256 "cf9707b1ece85aa80becbc5f5383340ac5c9ecb957d2845138f84a9484e7af3e"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/22/artifacts/eks-a/v0.12.0/linux/amd64/eksctl-anywhere-v0.12.0-linux-amd64.tar.gz"
    sha256 "6db3a958816f19cb68365356052ef62a05c2bebe276c930481ca84ab4b7e1fa1"
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