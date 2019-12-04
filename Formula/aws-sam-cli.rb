# -*- coding: utf-8 -*-
class AwsSamCli < Formula
  include Language::Python::Virtualenv

  desc "AWS SAM CLI 🐿 is a tool for local development and testing of Serverless applications"
  homepage "https://github.com/awslabs/aws-sam-cli/"
  url "https://files.pythonhosted.org/packages/cb/40/32f19a0d8e730c4d464d7c54a273189c18123b6a0aaaab8c198824df7d53/aws-sam-cli-0.36.0.tar.gz"
  sha256 "b548512042eaca05eb46018a0f0f437c78219f66110918b9ffd1396009b5553f"
  head "https://github.com/awslabs/aws-sam-cli.git", :branch => "develop"
  bottle do
    root_url "https://github.com/awslabs/aws-sam-cli/releases/download/v0.36.0/"
    cellar :any_skip_relocation
    sha256 "9bbe7127a474b694c28fe3460752c7cd9476a68182e0bcfef333cd30c4456029" => :sierra
    sha256 "ceff454f78ee9452452824c250337d54bcafa565a536c9d704ee2ed6af7b4214" => :x86_64_linux
  end

  depends_on "python"

  def install
    venv = virtualenv_create(libexec, "python3")
    system libexec/"bin/pip", "install", "pip==19.2.3"
    system libexec/"bin/pip", "install", "-v", "--ignore-installed", buildpath
    system libexec/"bin/pip", "uninstall", "-y", "aws-sam-cli"
    venv.pip_install_and_link buildpath
  end

  test do
    assert_match "Usage", shell_output("#{bin}/sam --help")
  end
end
