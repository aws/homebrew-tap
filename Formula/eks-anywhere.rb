class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.11.2"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/18/artifacts/eks-a/v0.11.2/darwin/amd64/eksctl-anywhere-v0.11.2-darwin-amd64.tar.gz"
    sha256 "c80515cdc3a35ce44adfda7d45a02f571b13ba7a50d1e1c52d34b66f785fe9e7"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/18/artifacts/eks-a/v0.11.2/linux/amd64/eksctl-anywhere-v0.11.2-linux-amd64.tar.gz"
    sha256 "bd5ec0ae6fe5360ddb56ba00552a5544048d4b9d43d3e8ca3ba86982efde8325"
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