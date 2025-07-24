class EksAnywhereAT022 < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.22.7"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/102/artifacts/eks-a/v0.22.7/darwin/arm64/eksctl-anywhere-v0.22.7-darwin-arm64.tar.gz"
    sha256 "491fb418ae6fe6fc3f3a8a878ecf1f40d6746efd033995d77d47d45d43cb06b0"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/102/artifacts/eks-a/v0.22.7/darwin/amd64/eksctl-anywhere-v0.22.7-darwin-amd64.tar.gz"
    sha256 "b9fb0b2a1c37a1be698aaae8cc4d38666163573d7b335ce07234d14c60a7f813"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/102/artifacts/eks-a/v0.22.7/linux/arm64/eksctl-anywhere-v0.22.7-linux-arm64.tar.gz"
    sha256 "7f6614f301a897bad68ed916fc35aae230176e601fb9db5997945d1721496ec2"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/102/artifacts/eks-a/v0.22.7/linux/amd64/eksctl-anywhere-v0.22.7-linux-amd64.tar.gz"
    sha256 "ee929641ab4518987f70357cb08dfe3d66502adfadea00aab4b13118813b8ebe"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end