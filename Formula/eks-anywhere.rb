class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.6.0"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/2/artifacts/eks-a/v0.6.0/darwin/eksctl-anywhere-v0.6.0-darwin-amd64.tar.gz"
    sha256 "25d4cc5eab63de4f435dcca558d277d317c42db920b03366decca7d883cfbebe"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/2/artifacts/eks-a/v0.6.0/linux/eksctl-anywhere-v0.6.0-linux-amd64.tar.gz"
    sha256 "a6c235b974821a35417141333e901c8e6a230238b5f3b8f70a0c3cad74bfc26c"
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
