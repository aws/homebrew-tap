class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.16.0"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/39/artifacts/eks-a/v0.16.0/darwin/amd64/eksctl-anywhere-v0.16.0-darwin-amd64.tar.gz"
    sha256 "4aa272abb125f3aa8beb1dba1c53f66044daae27d943d9b0a106164acbc9025f"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/39/artifacts/eks-a/v0.16.0/linux/amd64/eksctl-anywhere-v0.16.0-linux-amd64.tar.gz"
    sha256 "21e5fe2230fd4757dd6e82e3e22f6bfb149ae2dfc5b62683a5d2ff553c917664"
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