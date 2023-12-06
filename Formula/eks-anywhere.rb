class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.18.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/53/artifacts/eks-a/v0.18.2/darwin/arm64/eksctl-anywhere-v0.18.2-darwin-arm64.tar.gz"
    sha256 "b07d629fb3d52944f38fbd4bec8511a49fdbd933e10792ef41ab800f84ac278b"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/53/artifacts/eks-a/v0.18.2/darwin/amd64/eksctl-anywhere-v0.18.2-darwin-amd64.tar.gz"
    sha256 "d2410b4300d2ec61fc771c733503df7fa66f3ac527bff12dd8f9e0b98f853459"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/53/artifacts/eks-a/v0.18.2/linux/arm64/eksctl-anywhere-v0.18.2-linux-arm64.tar.gz"
    sha256 "b54ba7ae56f2a90ceefd7d000bfc7e4f6b04c9f276037ad7eff3c81db232c6e1"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/53/artifacts/eks-a/v0.18.2/linux/amd64/eksctl-anywhere-v0.18.2-linux-amd64.tar.gz"
    sha256 "f557608e4ce5d68b3a8df4f65cc21d4e2db85687fa8e97f6f425817e32fd1d18"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end