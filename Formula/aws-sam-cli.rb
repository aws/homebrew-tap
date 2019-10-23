# -*- coding: utf-8 -*-
class AwsSamCli < Formula
  include Language::Python::Virtualenv

  desc "AWS SAM CLI 🐿 is a tool for local development and testing of Serverless applications"
  homepage "https://github.com/awslabs/aws-sam-cli/"
  url "https://files.pythonhosted.org/packages/4b/4f/bab2b09d6ec0138a9b49a8f067a15d4d13318e3916306f695931aada2bdb/aws-sam-cli-0.23.0.tar.gz"
  sha256 "409e3497d57ae90d1ce2cae62d5964880b22d41da4d2e90831ae2ca37a593e1f"
  head "https://github.com/awslabs/aws-sam-cli.git", :branch => "develop"
  bottle do
    root_url "https://github.com/awslabs/aws-sam-cli/releases/download/v0.22.0/"
    cellar :any_skip_relocation
    sha256 "1b8beecfd52d256800a2a75e124e7abbd2de5bedb06d8da5eb6244def0e89817" => :sierra
    sha256 "f3ddacad90a11aabfad1b12f8cabf19bf83fb8a91c05fe0f802653d6227ee313" => :x86_64_linux
  end

  depends_on "python"

  def install
    venv = virtualenv_create(libexec, "python3")
    system libexec/"bin/pip", "install", "-v", "--no-binary", ":all:",
                              "--ignore-installed", buildpath
    system libexec/"bin/pip", "uninstall", "-y", "aws-sam-cli"
    venv.pip_install_and_link buildpath
  end

  test do
    assert_match "Usage", shell_output("#{bin}/sam --help")
  end
end
