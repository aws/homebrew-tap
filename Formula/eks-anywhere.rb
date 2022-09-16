class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.11.3"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/20/artifacts/eks-a/v0.11.3/darwin/amd64/eksctl-anywhere-v0.11.3-darwin-amd64.tar.gz"
    sha256 "e5af310c89b71a62bb1ccc85556a80c7eb822dab5b84038572bc13d25b9a27fb"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/20/artifacts/eks-a/v0.11.3/linux/amd64/eksctl-anywhere-v0.11.3-linux-amd64.tar.gz"
    sha256 "6ba14bb9368197dfa8fffd75146ca571757206b8d0046a7fd689140b07b46524"
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