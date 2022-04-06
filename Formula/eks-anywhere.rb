class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.8.0"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/8/artifacts/eks-a/v0.8.0/darwin/amd64/eksctl-anywhere-v0.8.0-darwin-amd64.tar.gz"
    sha256 "146ae6646a9723a197e99f3f0b064535235c5418e40deb9e5c6896d649b12357"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/8/artifacts/eks-a/v0.8.0/linux/amd64/eksctl-anywhere-v0.8.0-linux-amd64.tar.gz"
    sha256 "e2a896cde24832f15bd183714060f1801da0171db9f1af394aff2162e2ad195c"  
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
