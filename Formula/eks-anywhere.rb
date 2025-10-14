class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.23.4"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/107/artifacts/eks-a/v0.23.4/darwin/arm64/eksctl-anywhere-v0.23.4-darwin-arm64.tar.gz"
    sha256 "d99f4b5e99e50b365c8db7468c542e5d0f07bedd9f8ad7e1bd71a34fc784a9c6"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/107/artifacts/eks-a/v0.23.4/darwin/amd64/eksctl-anywhere-v0.23.4-darwin-amd64.tar.gz"
    sha256 "81f636304f03459b6001dc8e118220d49522e3520b4b6c1124fa3934e2ee528f"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/107/artifacts/eks-a/v0.23.4/linux/arm64/eksctl-anywhere-v0.23.4-linux-arm64.tar.gz"
    sha256 "466eeaa47617437392737586973b7e3a5b64a1f514c49d4ca0f25bac3890a668"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/107/artifacts/eks-a/v0.23.4/linux/amd64/eksctl-anywhere-v0.23.4-linux-amd64.tar.gz"
    sha256 "78390b321e3091367d94aaa8edfe64c5cefea8db977a9cae281005f1e27268f1"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end