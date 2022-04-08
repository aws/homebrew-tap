class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.8.1"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/9/artifacts/eks-a/v0.8.1/darwin/amd64/eksctl-anywhere-v0.8.1-darwin-amd64.tar.gz"
    sha256 "a66138587b21d562e1c8c8edbab4e194be4de83c8b83673e00e40f3d941ee87a"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/9/artifacts/eks-a/v0.8.1/linux/amd64/eksctl-anywhere-v0.8.1-linux-amd64.tar.gz"
    sha256 "3209e90879e87306d953e1d1ecafdcab06cf337ba5b350d166d31f1415c07ca1"
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
