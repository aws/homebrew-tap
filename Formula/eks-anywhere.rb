class EksAnywhere < Formula
  desc "CLI for managing EKS Anywhere Kubernetes clusters"
  homepage "https://github.com/aws/eks-anywhere"
  version "0.12.2"

  if OS.mac?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/24/artifacts/eks-a/v0.12.2/darwin/amd64/eksctl-anywhere-v0.12.2-darwin-amd64.tar.gz"
    sha256 "76b383a790601383143b6ad4e5c343fc78e94acb3e9aa14f786a9f2c76931aa9"
  end

  if OS.linux?
    url "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/24/artifacts/eks-a/v0.12.2/linux/amd64/eksctl-anywhere-v0.12.2-linux-amd64.tar.gz"
    sha256 "3b9fe4b00f4f4cdf8b0bbedc9429a2b3e327ec4f0c560d8491115dbd3fef9e77"
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