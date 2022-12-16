class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.13.0"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/25/artifacts/eks-a/v0.13.0/darwin/amd64/eksctl-anywhere-v0.13.0-darwin-amd64.tar.gz"
    sha256 "be5276c9ba5a94a3bd34147bee7ce492a4f93e6fd35a66b0061c99749097a393"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/25/artifacts/eks-a/v0.13.0/linux/amd64/eksctl-anywhere-v0.13.0-linux-amd64.tar.gz"
    sha256 "bfd3b3b130d8f2ca07faaf3bc59acf002849ce17e51b030de6678fc86958ca08"
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