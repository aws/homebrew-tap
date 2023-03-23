class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.14.5"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/32/artifacts/eks-a/v0.14.5/darwin/amd64/eksctl-anywhere-v0.14.5-darwin-amd64.tar.gz"
    sha256 "cbb10e982c6b28c71fec85235b55e6e8b753e977ca6944835d0e3dc6db8b9565"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/32/artifacts/eks-a/v0.14.5/linux/amd64/eksctl-anywhere-v0.14.5-linux-amd64.tar.gz"
    sha256 "65b62c97953b29803a50068c6b32c0a69d6fcb0f766a16fdd620c83544f9df3e"
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