class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.14.4"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/31/artifacts/eks-a/v0.14.4/darwin/amd64/eksctl-anywhere-v0.14.4-darwin-amd64.tar.gz"
    sha256 "18e71ebd2110c82565b0b522d9f3d663b16ba418db34fbf75ff5d6959996b865"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/31/artifacts/eks-a/v0.14.4/linux/amd64/eksctl-anywhere-v0.14.4-linux-amd64.tar.gz"
    sha256 "86abed4f81f0b9fa6668d61d00bfa45ccc7e0bda4383fb60bb05d6e0a0f12294"
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