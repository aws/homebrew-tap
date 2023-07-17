class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.16.2"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/41/artifacts/eks-a/v0.16.2/darwin/amd64/eksctl-anywhere-v0.16.2-darwin-amd64.tar.gz"
    sha256 "06104e71fd5177d6a712f98e651bd4f0e58fe234b8539a4b0c7cdefbcc2a1791"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/41/artifacts/eks-a/v0.16.2/linux/amd64/eksctl-anywhere-v0.16.2-linux-amd64.tar.gz"
    sha256 "fc4bce850f2b9d480caf6877b5ff11022800a85f0e1059760312d36f505681d7"
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