class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.14.3"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/30/artifacts/eks-a/v0.14.3/darwin/amd64/eksctl-anywhere-v0.14.3-darwin-amd64.tar.gz"
    sha256 "97994a7a84deb8ff3158b53b7523e052525ad113eb5507132d86ae9013d20752"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/30/artifacts/eks-a/v0.14.3/linux/amd64/eksctl-anywhere-v0.14.3-linux-amd64.tar.gz"
    sha256 "b42d70e7d63ee53b03d64df19d2c88398125d7de87110f2fa9e14b9bf9778765"
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