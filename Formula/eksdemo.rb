# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Eksdemo < Formula
  desc "The easy button for learning, testing and demoing Amazon EKS"
  homepage "https://github.com/awslabs/eksdemo"
  version "0.18.2"
  license "MIT-0"

  depends_on "weaveworks/tap/eksctl"

  on_macos do
    on_intel do
      url "https://github.com/awslabs/eksdemo/releases/download/v0.18.2/eksdemo_Darwin_x86_64.tar.gz"
      sha256 "19b47cc0343cf29d0cd35c06f5c64563402199aef9adb45c20cdbc9ff20213c8"

      def install
        bin.install "eksdemo"
        bash_completion.install "completions/eksdemo.bash" => "eksdemo"
        zsh_completion.install "completions/eksdemo.zsh" => "_eksdemo"
        fish_completion.install "completions/eksdemo.fish"
      end
    end
    on_arm do
      url "https://github.com/awslabs/eksdemo/releases/download/v0.18.2/eksdemo_Darwin_arm64.tar.gz"
      sha256 "590b6dbe295c9f88a030df8eab34d4c741eb1b19ed0e5b5fac0f17e1e9400f96"

      def install
        bin.install "eksdemo"
        bash_completion.install "completions/eksdemo.bash" => "eksdemo"
        zsh_completion.install "completions/eksdemo.zsh" => "_eksdemo"
        fish_completion.install "completions/eksdemo.fish"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/awslabs/eksdemo/releases/download/v0.18.2/eksdemo_Linux_x86_64.tar.gz"
        sha256 "dc1c749a8fc14385316ff59c10b325438b9ba828fef7385b072817bb8a849b6f"

        def install
          bin.install "eksdemo"
          bash_completion.install "completions/eksdemo.bash" => "eksdemo"
          zsh_completion.install "completions/eksdemo.zsh" => "_eksdemo"
          fish_completion.install "completions/eksdemo.fish"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/awslabs/eksdemo/releases/download/v0.18.2/eksdemo_Linux_arm64.tar.gz"
        sha256 "8e55542bbf55ef2b63097197486d72cc0f84222743c155174f53dd3ddec437d1"

        def install
          bin.install "eksdemo"
          bash_completion.install "completions/eksdemo.bash" => "eksdemo"
          zsh_completion.install "completions/eksdemo.zsh" => "_eksdemo"
          fish_completion.install "completions/eksdemo.fish"
        end
      end
    end
  end
end
