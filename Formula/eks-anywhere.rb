class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.15.1"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/35/artifacts/eks-a/v0.15.1/darwin/amd64/eksctl-anywhere-v0.15.1-darwin-amd64.tar.gz"
    sha256 "d2caf4e336c15ee28af15ce8dfd0ae12ca58e6e9c6e6d100d2fff8a658ca7429"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/35/artifacts/eks-a/v0.15.1/linux/amd64/eksctl-anywhere-v0.15.1-linux-amd64.tar.gz"
    sha256 "e655ac91e38341faa1c234f94b6de212282c7a06623d51ae69844e4608e740b4"
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