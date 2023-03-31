class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.15.0"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/33/artifacts/eks-a/v0.15.0/darwin/amd64/eksctl-anywhere-v0.15.0-darwin-amd64.tar.gz"
    sha256 "818a597f44422d374273cdc129f3d1995eda31824f257e8bc7e9b3838ae1129b"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/33/artifacts/eks-a/v0.15.0/linux/amd64/eksctl-anywhere-v0.15.0-linux-amd64.tar.gz"
    sha256 "21dde08044fc63597f0e4bc0d6dcf892c7afa95a4c69482c6ff77e4027a8c88f"
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