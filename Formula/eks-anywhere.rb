class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.11.0"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/16/artifacts/eks-a/v0.11.0/darwin/amd64/eksctl-anywhere-v0.11.0-darwin-amd64.tar.gz"
    sha256 "e8094fe8dd84a6176c397fd6fb2ab17fcf2f19863081b2cd00589ced8a224653"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/16/artifacts/eks-a/v0.11.0/linux/amd64/eksctl-anywhere-v0.11.0-linux-amd64.tar.gz"
    sha256 "974153590751f2b1cfb60702d9253643668e6f8843cb8faad75dc9c60efd1971"
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