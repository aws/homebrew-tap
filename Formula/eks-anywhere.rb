class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.6.1"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/3/artifacts/eks-a/v0.6.1/darwin/eksctl-anywhere-v0.6.1-darwin-amd64.tar.gz"
    sha256 "f21d324b37954f483a3467018ec7cd85d7829a87a70a845462378bc48efbe1f2"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/3/artifacts/eks-a/v0.6.1/linux/eksctl-anywhere-v0.6.1-linux-amd64.tar.gz"
    sha256 "9571f13abb08672acf0b144e4c21138d59d32cdcdf1e22b27a38e0fb5ebb6bfa"
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

  def install
    bin.install "eksctl-anywhere"
  end
end
