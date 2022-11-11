class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.12.1"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/23/artifacts/eks-a/v0.12.1/darwin/amd64/eksctl-anywhere-v0.12.1-darwin-amd64.tar.gz"
    sha256 "5665df4b3536b72097b3da089d6307cf31cf33a807c760c84ed8c6e5b8fa27e3"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/23/artifacts/eks-a/v0.12.1/linux/amd64/eksctl-anywhere-v0.12.1-linux-amd64.tar.gz"
    sha256 "e0903c2833e05ebf26d7edaf7779f4d57b8915a900b75407e95bdd1609c27d87"
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