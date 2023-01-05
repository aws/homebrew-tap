class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.13.1"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/26/artifacts/eks-a/v0.13.1/darwin/amd64/eksctl-anywhere-v0.13.1-darwin-amd64.tar.gz"
    sha256 "39e5f9f6d552374d923a1d766a7ab2fd33a04c215e9eaa600e03feb4e76fb3db"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/26/artifacts/eks-a/v0.13.1/linux/amd64/eksctl-anywhere-v0.13.1-linux-amd64.tar.gz"
    sha256 "4f2242582b339fb7af1b477337f6985577a166d00c032260650b75bb210af47c"
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