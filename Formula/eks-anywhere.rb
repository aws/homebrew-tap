class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.11.4"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/21/artifacts/eks-a/v0.11.4/darwin/amd64/eksctl-anywhere-v0.11.4-darwin-amd64.tar.gz"
    sha256 "8f64aa71d9f33e99c7f37fe506fd03710de4850997d8f0bb1efcfa83e4fb6a8e"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/21/artifacts/eks-a/v0.11.4/linux/amd64/eksctl-anywhere-v0.11.4-linux-amd64.tar.gz"
    sha256 "cef96a3df1e67cd8752c2f9e0bda7d23bad9713342f8833263fbfc4deb92c877"
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