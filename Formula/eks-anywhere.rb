class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.15.3"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/37/artifacts/eks-a/v0.15.3/darwin/amd64/eksctl-anywhere-v0.15.3-darwin-amd64.tar.gz"
    sha256 "92f8750071d077424db810a1109d8ae27817c38c55279ec962cb62d2502e2bfa"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/37/artifacts/eks-a/v0.15.3/linux/amd64/eksctl-anywhere-v0.15.3-linux-amd64.tar.gz"
    sha256 "8f4fded5c5aa6464b846fab4e46eca52f736ffc5a670aa969d29142d87a53e9c"
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