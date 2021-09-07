class EksAnywhere < Formula
    desc "CLI for managing EKS Anywhere Kubernetes clusters"
    homepage "https://github.com/aws/eks-anywhere"
    version "0.5.0"
    bottle :unneeded
  
    on_macos do
      if Hardware::CPU.intel?
        url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/1/artifacts/eks-a/v0.5.0/darwin/eksctl-anywhere-v0.5.0-darwin-amd64.tar.gz"
        sha256 "6280f406f5596df83e2b994f1279b0c4992559f29858d666c99e4f4e0043ba94"
      end
    end
  
    on_linux do
      if Hardware::CPU.intel?
        url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/1/artifacts/eks-a/v0.5.0/linux/eksctl-anywhere-v0.5.0-linux-amd64.tar.gz"
        sha256 "0c271984896d2ea7a7bdb8c380cf845f63b8e4a6b54a1c47bb3bc5acadfc9a3d"
      end
    end
  
    # depends_on "weaveworks/tap/eksctl": '>= 0.66.0'
  
    def install
      bin.install "eksctl-anywhere"
    end
  end