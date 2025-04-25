class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.22.4"

  if OS.mac? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/97/artifacts/eks-a/v0.22.4/darwin/arm64/eksctl-anywhere-v0.22.4-darwin-arm64.tar.gz"
    sha256 "2b85c8c305916ababd871af33b1ac5be930de5a616c8d320a2dec108a831c1fd"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/97/artifacts/eks-a/v0.22.4/darwin/amd64/eksctl-anywhere-v0.22.4-darwin-amd64.tar.gz"
    sha256 "4f031dfb5a5be6723794e758fdc0a737c0ca74977b4e05f85ef08a03f30ddeb8"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/97/artifacts/eks-a/v0.22.4/linux/arm64/eksctl-anywhere-v0.22.4-linux-arm64.tar.gz"
    sha256 "0dc728575040b49ee8b5156bc71c99bb2513a2c0d4cadb4a4ac6a1fc24d4ba7f"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/97/artifacts/eks-a/v0.22.4/linux/amd64/eksctl-anywhere-v0.22.4-linux-amd64.tar.gz"
    sha256 "5bffa4ae772ddec6d0fa0cbf638563d20f32e97558356cd47868e6e6a0f08e3e"
  end

  depends_on "eksctl"
  depends_on "kubernetes-cli"

  def install
    bin.install "eksctl-anywhere"
  end
end