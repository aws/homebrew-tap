class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.7.0"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/5/artifacts/eks-a/v0.7.0/darwin/amd64/eksctl-anywhere-v0.7.0-darwin-amd64.tar.gz"
    sha256 "1c918f513ed34506177d2b9afc1a7124ea42fa42c692fd4adfaf2d0494a1c1e6"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/5/artifacts/eks-a/v0.7.0/linux/amd64/eksctl-anywhere-v0.7.0-linux-amd64.tar.gz"
    sha256 "2484f00bafdb860d418557fec5e7ab660647a0316ae541cdd58f0166a30cfa05"
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
