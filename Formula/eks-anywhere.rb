class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.21.6"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/90/artifacts/eks-a/v0.21.6/darwin/arm64/eksctl-anywhere-v0.21.6-darwin-arm64.tar.gz"
    sha256 "dc16a4484306a231a3452e32a987bb57a229a9a2d01ccb84ec1b14e6e36452d1"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/90/artifacts/eks-a/v0.21.6/darwin/amd64/eksctl-anywhere-v0.21.6-darwin-amd64.tar.gz"
    sha256 "7df00dced7558ebda57d448bb521549c6fc670cd10b7097278f603786e49486b"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/90/artifacts/eks-a/v0.21.6/linux/arm64/eksctl-anywhere-v0.21.6-linux-arm64.tar.gz"
    sha256 "6d61a012d7ad6fbcceb56a5938dfa877cc81dbff2db96fdda7e94c9665fb51e2"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/90/artifacts/eks-a/v0.21.6/linux/amd64/eksctl-anywhere-v0.21.6-linux-amd64.tar.gz"
    sha256 "a1a6502e8136b8cb38194ebca8571b3817b200a3b1ac521bbb620376b18f2cc3"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end