class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.17.2"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/47/artifacts/eks-a/v0.17.2/darwin/amd64/eksctl-anywhere-v0.17.2-darwin-amd64.tar.gz"
    sha256 "10fb8749f2310054421edf77f2e22cf0a9d2965434d92d0d45e7af457165464f"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/47/artifacts/eks-a/v0.17.2/linux/amd64/eksctl-anywhere-v0.17.2-linux-amd64.tar.gz"
    sha256 "58d3f0428408faa74cc1a9ec167b5c83c1052a5b17c94248094a9a8e8b8f412e"
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