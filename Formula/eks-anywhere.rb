class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.11.1"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/17/artifacts/eks-a/v0.11.1/darwin/amd64/eksctl-anywhere-v0.11.1-darwin-amd64.tar.gz"
    sha256 "0c2084bf6c509f6183ec56e54e5355fb0fabf93ab33e2894bd0143b547d857bd"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/17/artifacts/eks-a/v0.11.1/linux/amd64/eksctl-anywhere-v0.11.1-linux-amd64.tar.gz"
    sha256 "8ca1cee7d18e78e3f3ae7d346616b4bff116d363868d8c34d30e9da2a28b3b0c"
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