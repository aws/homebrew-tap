# typed: false
# frozen_string_literal: true

class Eksdemo < Formula
  desc "The easy button for learning, testing and demoing Amazon EKS"
  homepage "https://github.com/awslabs/eksdemo"
  version "0.9.0"
  license "MIT-0"

  depends_on "weaveworks/tap/eksctl"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/awslabs/eksdemo/releases/download/v0.9.0/eksdemo_Darwin_arm64.tar.gz"
      sha256 "4f6842b3621dc3fd13e1e2e9898481b4396e466c3c468b7ce71244e04c5f2294"

      def install
        bin.install "eksdemo"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/awslabs/eksdemo/releases/download/v0.9.0/eksdemo_Darwin_x86_64.tar.gz"
      sha256 "014b7c00933cf2930fef7e117213cabea6e91aac4ed216051a7d32f31362a6ee"

      def install
        bin.install "eksdemo"
      end
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/awslabs/eksdemo/releases/download/v0.9.0/eksdemo_Linux_arm64.tar.gz"
      sha256 "b0d0c1693553c05cecfdbdadafd3efedee0e768d97656513fb8a30e2c70153db"

      def install
        bin.install "eksdemo"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/awslabs/eksdemo/releases/download/v0.9.0/eksdemo_Linux_x86_64.tar.gz"
      sha256 "29f3ae48063c1b343fe728bad3239b89564142781682f66a44b9cb1a65cbcdad"

      def install
        bin.install "eksdemo"
      end
    end
  end
end
  
  