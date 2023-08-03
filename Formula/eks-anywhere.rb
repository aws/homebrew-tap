class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.16.3"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/42/artifacts/eks-a/v0.16.3/darwin/amd64/eksctl-anywhere-v0.16.3-darwin-amd64.tar.gz"
    sha256 "684c45fb4a9889832fd1c1edbc6b51801f936696397a74d67f9573d9ea8dc67e"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/42/artifacts/eks-a/v0.16.3/linux/amd64/eksctl-anywhere-v0.16.3-linux-amd64.tar.gz"
    sha256 "f00eb85c40ee76c8d9ddfcd053ab60b0e8cf0fabce1dfe92b94d9a4c3fc5f5a1"
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