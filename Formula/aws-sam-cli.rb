# -*- coding: utf-8 -*-
class AwsSamCli < Formula
  include Language::Python::Virtualenv

  desc "AWS SAM CLI 🐿 is a tool for local development and testing of Serverless applications"
  homepage "https://github.com/awslabs/aws-sam-cli/"
  url "https://files.pythonhosted.org/packages/49/9b/b70dda6e499ac7c83538c8bfa4a66d66157b10d70a3a38a2279dd25c227a/aws-sam-cli-0.37.0.tar.gz"
  sha256 "5d0d37c9102660e75972341b8761109a2d7539b80ca378fcd5cb6aae79a173de"
  head "https://github.com/awslabs/aws-sam-cli.git", :branch => "develop"
  bottle do
    root_url "https://github.com/awslabs/aws-sam-cli/releases/download/v0.37.0/"
    cellar :any_skip_relocation
    sha256 "f5a333388c4b0fc3f58417994dd73c598b844d933ecb246200893895fce7b5c7" => :sierra
    sha256 "56c6b77772c57d11ba790995151b881fb7354f85fb640e2eebde515b7252a55d" => :x86_64_linux
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
