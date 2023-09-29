class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.17.3"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/48/artifacts/eks-a/v0.17.3/darwin/amd64/eksctl-anywhere-v0.17.3-darwin-amd64.tar.gz"
    sha256 "41548a2f662e2f22beddcaa7d6f79283a094640e0cb6eafd29f460ae373af7d3"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/48/artifacts/eks-a/v0.17.3/linux/amd64/eksctl-anywhere-v0.17.3-linux-amd64.tar.gz"
    sha256 "bc7ef9b884e966b4aed9f27736a5f11f70fabe0422b417aec171416340e9c032"
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