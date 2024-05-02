class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.19.5"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/65/artifacts/eks-a/v0.19.5/darwin/arm64/eksctl-anywhere-v0.19.5-darwin-arm64.tar.gz"
    sha256 "1db1204946591c2931604302b982cef1c7ba3d14e99e8678d408a68830ed82fc"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/65/artifacts/eks-a/v0.19.5/darwin/amd64/eksctl-anywhere-v0.19.5-darwin-amd64.tar.gz"
    sha256 "b00774d9928267b4ef278a438573eb6a53ce6f93201e66a7caae3d8b26a51f9c"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/65/artifacts/eks-a/v0.19.5/linux/arm64/eksctl-anywhere-v0.19.5-linux-arm64.tar.gz"
    sha256 "341b6a24cda392e088e62c4fb9d0cbb02bda2671608e4630cdabb3e02ea71426"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/65/artifacts/eks-a/v0.19.5/linux/amd64/eksctl-anywhere-v0.19.5-linux-amd64.tar.gz"
    sha256 "8d272e4b1d2bdf2771cbd966b4251841e316bec0c3680d5eec5f4ae07d787e70"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end