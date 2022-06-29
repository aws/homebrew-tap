class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.9.2"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/13/artifacts/eks-a/v0.9.2/darwin/amd64/eksctl-anywhere-v0.9.2-darwin-amd64.tar.gz"
    sha256 "9b02d3e5fc9a985ada9eb1dde01a899d40ab3fb058f65b069701036c0452f211"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/13/artifacts/eks-a/v0.9.2/linux/amd64/eksctl-anywhere-v0.9.2-linux-amd64.tar.gz"
    sha256 "209a70592d80b5ba00b7320e7f27eab5a968e9acbe0c5433cd1aefd3cd1c8884"
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