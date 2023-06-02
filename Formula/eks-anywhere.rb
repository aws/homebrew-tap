class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.15.4"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/38/artifacts/eks-a/v0.15.4/darwin/amd64/eksctl-anywhere-v0.15.4-darwin-amd64.tar.gz"
    sha256 "a8947bc4b6aaa717b535f3a0fd2850b9814c46ce7d83c5ed55724d8d7a6ac411"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/38/artifacts/eks-a/v0.15.4/linux/amd64/eksctl-anywhere-v0.15.4-linux-amd64.tar.gz"
    sha256 "7716f64b1299e0d51172aa00ee26c025ef16ff86b7e047e93e08f1d41a7aec8f"
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