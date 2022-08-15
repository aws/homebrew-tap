class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.10.1"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/15/artifacts/eks-a/v0.10.1/darwin/amd64/eksctl-anywhere-v0.10.1-darwin-amd64.tar.gz"
    sha256 "c8f2770b6a2785bea4bb14321d3974e4ea7aa9867acbd379c549c73f6ddfc120"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/15/artifacts/eks-a/v0.10.1/linux/amd64/eksctl-anywhere-v0.10.1-linux-amd64.tar.gz"
    sha256 "a7628f2fa7f3e03b2c3f5b2a4afb0f5b547738ec41e46ba94484cbf2639fd056"
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