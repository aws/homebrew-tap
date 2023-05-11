# typed: false
# frozen_string_literal: true

class Eksdemo < Formula
  desc "The easy button for learning, testing and demoing Amazon EKS"
  homepage "https://github.com/awslabs/eksdemo"
  version "0.7.0"
  license "MIT-0"

  depends_on "weaveworks/tap/eksctl"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/awslabs/eksdemo/releases/download/v0.7.0/eksdemo_Darwin_arm64.tar.gz"
      sha256 "8a70b80f0108ade0cf3cf43b624c559e849ee7043566f6c7dd6be05c04ec697a"

      def install
        bin.install "eksdemo"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/awslabs/eksdemo/releases/download/v0.7.0/eksdemo_Darwin_x86_64.tar.gz"
      sha256 "748bbe8bfed9b3b3227108af648e9f01ea31ed33a417f0d3f836e668a43731c3"

      def install
        bin.install "eksdemo"
      end
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/awslabs/eksdemo/releases/download/v0.7.0/eksdemo_Linux_arm64.tar.gz"
      sha256 "dc36bcfec48c14b45676d668645a0e098f0bfb48209fba3b49d27e1a50de3799"

      def install
        bin.install "eksdemo"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/awslabs/eksdemo/releases/download/v0.7.0/eksdemo_Linux_x86_64.tar.gz"
      sha256 "b6251e593cc394f924fe684656a7427ceb19ff68989c7436c60cf433fdd084ee"

      def install
        bin.install "eksdemo"
      end
    end
  end
end
  
  