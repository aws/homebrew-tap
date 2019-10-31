# -*- coding: utf-8 -*-
class AwsSamCli < Formula
  include Language::Python::Virtualenv

  desc "AWS SAM CLI 🐿 is a tool for local development and testing of Serverless applications"
  homepage "https://github.com/awslabs/aws-sam-cli/"
  url "https://files.pythonhosted.org/packages/66/c9/e5bdfde7d48d9c4d3efde71505fdadfe1523060eff06426bcfa930644c72/aws-sam-cli-0.30.0.tar.gz"
  sha256 "614967a41f3e41421f23385d8e5368af04865b3571b5551a6a89679b5f2c3f7b"
  head "https://github.com/awslabs/aws-sam-cli.git", :branch => "develop"
  bottle do
    root_url "https://github.com/awslabs/aws-sam-cli/releases/download/v0.30.0/"
    cellar :any_skip_relocation
    sha256 "dfe5c3131220a1001a4083a82eeee711f349cb4fedbfd2a4986dbc55f13c8efe" => :sierra
    sha256 "82aed231a0bfa2d915ff1348c825e8e6c28c1110436343c0ed22e8904fb3ec81" => :x86_64_linux
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
