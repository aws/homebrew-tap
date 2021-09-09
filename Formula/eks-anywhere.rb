class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.5.0"
  bottle :unneeded

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/1/artifacts/eks-a/v0.5.0/darwin/eksctl-anywhere-v0.5.0-darwin-amd64.tar.gz"
    sha256 "ed7790c706216b531a5f844529142d734b52b538d15dc4f6bc7cbf0e717ab0cd"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/1/artifacts/eks-a/v0.5.0/linux/eksctl-anywhere-v0.5.0-linux-amd64.tar.gz"
    sha256 "020ae9fb3b01070bda29e530d157089bf56e11245bde098118ea0350ed5f5ec4"
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

  def install
    bin.install "eksctl-anywhere"
  end
end
