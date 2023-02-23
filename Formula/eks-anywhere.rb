class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.14.2"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/29/artifacts/eks-a/v0.14.2/darwin/amd64/eksctl-anywhere-v0.14.2-darwin-amd64.tar.gz"
    sha256 "823df461de55d09a9c9d54d95cdd6be29e9716c1a2f8e1f07b773785dfde1a39"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/29/artifacts/eks-a/v0.14.2/linux/amd64/eksctl-anywhere-v0.14.2-linux-amd64.tar.gz"
    sha256 "1be26b89cd2d5ff62ae87b7c82e3b6b11a0d4174c776ec533a0b1b76220fcc2d"
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