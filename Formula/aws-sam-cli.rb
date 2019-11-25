# -*- coding: utf-8 -*-
class AwsSamCli < Formula
  include Language::Python::Virtualenv

  desc "AWS SAM CLI 🐿 is a tool for local development and testing of Serverless applications"
  homepage "https://github.com/awslabs/aws-sam-cli/"
  url "https://files.pythonhosted.org/packages/4e/f8/a8207eb13afa30183fcf1a6d8b7150343d22e77fd31b9940fd20e1142baa/aws-sam-cli-0.33.1.tar.gz"
  sha256 "019d7306e57b751aacee81250a47d2feb78e189f56e6bcbd245465768ccb67bc"
  head "https://github.com/awslabs/aws-sam-cli.git", :branch => "develop"
  bottle do
    root_url "https://github.com/awslabs/aws-sam-cli/releases/download/v0.32.0/"
    cellar :any_skip_relocation
    sha256 "46a9b32cdc1a976658c75e6b0377d4bb9bda55a5edf4c9d34ec2c774b690075c" => :sierra
    sha256 "7f7420a4ca3e2236fd7d6c4fa9c89fac78dd60637751a92845395dab7e9ed41a" => :x86_64_linux
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
