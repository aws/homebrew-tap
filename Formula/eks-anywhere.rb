class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.17.1"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/46/artifacts/eks-a/v0.17.1/darwin/amd64/eksctl-anywhere-v0.17.1-darwin-amd64.tar.gz"
    sha256 "22e588da5c3a20c5f742bb4920008a5c67898901735a0fc7794ad5f0e6de1d5d"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/46/artifacts/eks-a/v0.17.1/linux/amd64/eksctl-anywhere-v0.17.1-linux-amd64.tar.gz"
    sha256 "85d6d6790e9f0da90603a808a6f9c455eed0bc6e880f2036b900409ed5e3a82d"
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