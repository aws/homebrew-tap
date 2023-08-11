class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.16.4"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/43/artifacts/eks-a/v0.16.4/darwin/amd64/eksctl-anywhere-v0.16.4-darwin-amd64.tar.gz"
    sha256 "c4fb00aaeb789730c85b4cbc7e2ae3861d0a2e3170f1361571e6f12042005fc2"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/43/artifacts/eks-a/v0.16.4/linux/amd64/eksctl-anywhere-v0.16.4-linux-amd64.tar.gz"
    sha256 "2566e6409c8379b7fe206057d60c558279232c7e129f4292f81ca3294ca07f61"
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