# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class CodecatalystRunnerCli < Formula
  desc "CLI to run CodeCatalyst workflows locally 🧰"
  homepage "https://github.com/aws/codecatalyst-runner-cli"
  version "0.4.17"
  license "Apache-2"

  on_macos do
    on_intel do
      url "https://github.com/aws/codecatalyst-runner-cli/releases/download/0.4.17/ccr_Darwin_x86_64.tar.gz"
      sha256 "af959da1b9c3f78028e4d7aa205133e776efe5c3581daeca2562c37cd38d5217"

      def install
        bin.install "ccr"
      end
    end
    on_arm do
      url "https://github.com/aws/codecatalyst-runner-cli/releases/download/0.4.17/ccr_Darwin_arm64.tar.gz"
      sha256 "3a93aaec311fb5337ef67c53a4dd3f3fa831ea3aed6bd835ffc47a5a2855d22f"

      def install
        bin.install "ccr"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/aws/codecatalyst-runner-cli/releases/download/0.4.17/ccr_Linux_x86_64.tar.gz"
        sha256 "9321d6e908677cd1f466fb008e86c5a7bc8921696d51ff07e51b711d08cda8d8"

        def install
          bin.install "ccr"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/aws/codecatalyst-runner-cli/releases/download/0.4.17/ccr_Linux_arm64.tar.gz"
        sha256 "d034f0621d604eb3c02a0dc18dfbb4cfa41c78e32bb6f681e1d0eb6754102892"

        def install
          bin.install "ccr"
        end
      end
    end
  end

  test do
    system "#{bin}/ccr --version"
  end
end
