class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.9.1"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/12/artifacts/eks-a/v0.9.1/darwin/amd64/eksctl-anywhere-v0.9.1-darwin-amd64.tar.gz"
    sha256 "9f8eb8f2e1c3d9f1d9d57309e5ccb379d083bc9725d4cd01083c0ac6d75570b0"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/12/artifacts/eks-a/v0.9.1/linux/amd64/eksctl-anywhere-v0.9.1-linux-amd64.tar.gz"
    sha256 "669e600733cccee94f6f0e063bb42d226f7eaa5a2b4e29b5d1f9d8cd4aa34ab0"
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