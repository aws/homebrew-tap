class EksAnywhere < Formula
    desc "CLI for managing EKS Anywhere Kubernetes clusters"
    homepage "https://github.com/aws/eks-anywhere"
    version "0.5.0"
    bottle :unneeded

    on_macos do
      if Hardware::CPU.intel?
        url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/1/artifacts/eks-a/v0.5.0/darwin/eksctl-anywhere-v0.5.0-darwin-amd64.tar.gz"
        sha256 "ed7790c706216b531a5f844529142d734b52b538d15dc4f6bc7cbf0e717ab0cd"
      end
    end

    on_linux do
      if Hardware::CPU.intel?
        url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/1/artifacts/eks-a/v0.5.0/linux/eksctl-anywhere-v0.5.0-linux-amd64.tar.gz"
        sha256 "020ae9fb3b01070bda29e530d157089bf56e11245bde098118ea0350ed5f5ec4"
      end
    end

    depends_on "weaveworks/tap/eksctl"

    def install
      bin.install "eksctl-anywhere"
    end
  end
