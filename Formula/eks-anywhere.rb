class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.9.0"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/11/artifacts/eks-a/v0.9.0/darwin/amd64/eksctl-anywhere-v0.9.0-darwin-amd64.tar.gz"
    sha256 "5dc8b098e32cc414608ecd5303ae042124f6f6b2cffea13a46114b82626532ca"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/11/artifacts/eks-a/v0.9.0/linux/amd64/eksctl-anywhere-v0.9.0-linux-amd64.tar.gz"
    sha256 "58408f9f72fa3fb816378cca68c4e61bc391311043cafb05a0c2ec9f79685615"
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