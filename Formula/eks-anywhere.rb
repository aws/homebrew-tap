class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.14.1"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/28/artifacts/eks-a/v0.14.1/darwin/amd64/eksctl-anywhere-v0.14.1-darwin-amd64.tar.gz"
    sha256 "c9b3c83d253af7aa1690319c9e0b8d0709a9b244ca83daffe650c70d03b25d2d"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/28/artifacts/eks-a/v0.14.1/linux/amd64/eksctl-anywhere-v0.14.1-linux-amd64.tar.gz"
    sha256 "9771127f11524231b42a1b5bd50f4ef1fa9eefa2856b876cbf9ff0d5451a97a6"
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