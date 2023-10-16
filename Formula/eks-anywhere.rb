class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.17.4"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/49/artifacts/eks-a/v0.17.4/darwin/amd64/eksctl-anywhere-v0.17.4-darwin-amd64.tar.gz"
    sha256 "71185fb7ec5f0ad40185d538397e06427e4462afdf85712fac158393ba1dc371"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/49/artifacts/eks-a/v0.17.4/linux/amd64/eksctl-anywhere-v0.17.4-linux-amd64.tar.gz"
    sha256 "388d3fd5632a0de10c765da07f10e573652df3458055d139e79be394584f2936"
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