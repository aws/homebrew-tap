# -*- coding: utf-8 -*-
class AwsSamCli < Formula
  include Language::Python::Virtualenv

  desc "AWS SAM CLI 🐿 is a tool for local development and testing of Serverless applications"
  homepage "https://github.com/awslabs/aws-sam-cli/"
  url "https://files.pythonhosted.org/packages/6e/4f/40c6bd59a5273812b2b48ebb1b5b4c6b7cc765315e6155d431b8752bd770/aws-sam-cli-0.19.0.tar.gz"
  sha256 "ab5978e9c4973145533e47b9e5b80e3d56dcc7a8d58c3c9fb3de4ce1681582e5"
  head "https://github.com/awslabs/aws-sam-cli.git", :branch => "develop"
  bottle do
    root_url "https://github.com/awslabs/aws-sam-cli/releases/download/v0.19.0/"
    cellar :any_skip_relocation
    sha256 "c971e6bd404ee8d0cca107bd3cb549dfdee26024800d702d295c2b65e08f367b" => :sierra
    sha256 "0e3505414b2b580f07e21f1fe0ff03958effefbc63ce61b6ec326f970ad292c2" => :x86_64_linux
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
