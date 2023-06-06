# typed: false
# frozen_string_literal: true

class Eksdemo < Formula
  desc "The easy button for learning, testing and demoing Amazon EKS"
  homepage "https://github.com/awslabs/eksdemo"
  version "0.8.0"
  license "MIT-0"

  depends_on "weaveworks/tap/eksctl"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/awslabs/eksdemo/releases/download/v0.8.0/eksdemo_Darwin_arm64.tar.gz"
      sha256 "991b96d924c3ed9ccc5ec14bf57027be5a1e75b4c3974f75f78a15b7629c530b"

      def install
        bin.install "eksdemo"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/awslabs/eksdemo/releases/download/v0.8.0/eksdemo_Darwin_x86_64.tar.gz"
      sha256 "32db7d237d80264ddc5786655977041d10589e19349d77a9b190f82bb9a17b6b"

      def install
        bin.install "eksdemo"
      end
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/awslabs/eksdemo/releases/download/v0.8.0/eksdemo_Linux_arm64.tar.gz"
      sha256 "25c7d584f25663414718275ef5970dee15c0875519cbfa8f00ed20e4ebd2ef94"

      def install
        bin.install "eksdemo"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/awslabs/eksdemo/releases/download/v0.8.0/eksdemo_Linux_x86_64.tar.gz"
      sha256 "f38a2d8d1a61ab4fdf3b07ecccd53c38c7af9d9aee76d2f725f14f1c23247fe1"

      def install
        bin.install "eksdemo"
      end
    end
  end
end
  
  