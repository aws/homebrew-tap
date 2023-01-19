class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.14.0"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/27/artifacts/eks-a/v0.14.0/darwin/amd64/eksctl-anywhere-v0.14.0-darwin-amd64.tar.gz"
    sha256 "cddd8843a3c6447c6fbeb1ca37a82f47060ee70557156207e6386b26c2ff2532"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/27/artifacts/eks-a/v0.14.0/linux/amd64/eksctl-anywhere-v0.14.0-linux-amd64.tar.gz"
    sha256 "85d8c93fa922811ea5c29baae2c27a79a9c047703f83c336d43ad4d0293466d5"
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