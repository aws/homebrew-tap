# -*- coding: utf-8 -*-
class AwsSamCli < Formula
  include Language::Python::Virtualenv

  desc "AWS SAM CLI 🐿 is a tool for local development and testing of Serverless applications"
  homepage "https://github.com/awslabs/aws-sam-cli/"
  url "https://files.pythonhosted.org/packages/3c/ed/98b8f3c6ac8590ab10fb74c799de5ed9f4413bc425655675bc3bdba74e35/aws-sam-cli-0.18.0.tar.gz"
  sha256 "5ed0b17b293a0469fd793999449d110088bfcdb7bc5d7d3db9a70e6b526af420"
  head "https://github.com/awslabs/aws-sam-cli.git", :branch => "develop"
  bottle do
    root_url "https://github.com/awslabs/aws-sam-cli/releases/download/v0.17.0/"
    cellar :any_skip_relocation
    sha256 "88f4a568fc251879306f5f5d12d79c6d80895188fac267f18ba2a587f1fe3e48" => :sierra
    sha256 "70cb8103f1492b7ca1dc045803d9e99712479d762f7b06ef5a6e67b5f35f4f49" => :x86_64_linux
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
