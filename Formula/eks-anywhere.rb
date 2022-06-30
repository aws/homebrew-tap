class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.10.0"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/14/artifacts/eks-a/v0.10.0/darwin/amd64/eksctl-anywhere-v0.10.0-darwin-amd64.tar.gz"
    sha256 "fdc07cf7e0cb2aae97fab68250c4fbe9a4f547bedad63985965f9fd476608e74"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/14/artifacts/eks-a/v0.10.0/linux/amd64/eksctl-anywhere-v0.10.0-linux-amd64.tar.gz"
    sha256 "2f977df6b95156574be917a34c0787039a580c3864841217bf4d22e814b46376"
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