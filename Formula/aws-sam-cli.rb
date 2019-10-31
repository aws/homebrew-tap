# -*- coding: utf-8 -*-
class AwsSamCli < Formula
  include Language::Python::Virtualenv

  desc "AWS SAM CLI 🐿 is a tool for local development and testing of Serverless applications"
  homepage "https://github.com/awslabs/aws-sam-cli/"
  url "https://files.pythonhosted.org/packages/66/c9/e5bdfde7d48d9c4d3efde71505fdadfe1523060eff06426bcfa930644c72/aws-sam-cli-0.30.0.tar.gz"
  sha256 "614967a41f3e41421f23385d8e5368af04865b3571b5551a6a89679b5f2c3f7b"
  head "https://github.com/awslabs/aws-sam-cli.git", :branch => "develop"
  bottle do
    root_url "https://github.com/awslabs/aws-sam-cli/releases/download/v0.23.0/"
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
