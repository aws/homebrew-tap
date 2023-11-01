class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.18.0"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/50/artifacts/eks-a/v0.18.0/darwin/amd64/eksctl-anywhere-v0.18.0-darwin-amd64.tar.gz"
    sha256 "add3f52f639b86eef6c4a8e4f7b16dc60dc9360b698081c085c90e7e61f55e9d"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/50/artifacts/eks-a/v0.18.0/linux/amd64/eksctl-anywhere-v0.18.0-linux-amd64.tar.gz"
    sha256 "f6fe4f4a1592523193b76dcc228b76b1bc6bc715887562ba712cad236d4d37ad"
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
