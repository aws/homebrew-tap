# -*- coding: utf-8 -*-
class AwsSamCli < Formula
  include Language::Python::Virtualenv

  desc "AWS SAM CLI 🐿 is a tool for local development and testing of Serverless applications"
  homepage "https://github.com/awslabs/aws-sam-cli/"
  url "https://files.pythonhosted.org/packages/2e/53/df85a6cb9877779f1077d812d8d9ada9c33eaca9206250c74d80667b0e55/aws-sam-cli-0.22.0.tar.gz"
  sha256 "762ea54a8b1f594e110d19a44d9519ea062536008ed5afb33d9fd22229de8bba"
  head "https://github.com/awslabs/aws-sam-cli.git", :branch => "develop"
  bottle do
    root_url "https://github.com/awslabs/aws-sam-cli/releases/download/v0.21.0/"
    cellar :any_skip_relocation
    sha256 "a7f5d9d855462f1176d8acbf613705bb763a4208dc6db364e88c83ee5437d13b" => :sierra
    sha256 "88330979237520a3e6158066e35eb577fe681d22830b32b64a6acba29e791405" => :x86_64_linux
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
