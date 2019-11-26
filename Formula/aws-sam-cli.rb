# -*- coding: utf-8 -*-
class AwsSamCli < Formula
  include Language::Python::Virtualenv

  desc "AWS SAM CLI 🐿 is a tool for local development and testing of Serverless applications"
  homepage "https://github.com/awslabs/aws-sam-cli/"
  url "https://files.pythonhosted.org/packages/2c/4f/cda33dc06da70c6db23aee18ac75185bdc1aac37d7b0aed85d084b61091d/aws-sam-cli-0.34.0.tar.gz"
  sha256 "3336d53795608dcaaf565cf9c7817c80726af79b91138beba643e46fda62afd9"
  head "https://github.com/awslabs/aws-sam-cli.git", :branch => "develop"
  bottle do
    root_url "https://github.com/awslabs/aws-sam-cli/releases/download/v0.33.1/"
    cellar :any_skip_relocation
    sha256 "bcbf7b42bb595f5648531905ecdef2ed08fd6ee18b12d12abc3e324a980620a3" => :sierra
    sha256 "c8c81a137d75ff34e3c8476f28781882cad9893a950e1cba623a15e76d3bca92" => :x86_64_linux
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
