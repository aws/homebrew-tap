# -*- coding: utf-8 -*-
class AwsSamCli < Formula
  include Language::Python::Virtualenv

  desc "AWS SAM CLI 🐿 is a tool for local development and testing of Serverless applications"
  homepage "https://github.com/awslabs/aws-sam-cli/"
  url "https://files.pythonhosted.org/packages/05/f9/f46026826e0b39f54c00a2ebf4e3924106c1b849c8450891b7197606bae4/aws-sam-cli-0.33.0.tar.gz"
  sha256 "e47809146308b4cd243c822618c23c7b150148a6d9267febde6602b207a0fcd7"
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
    system libexec/"bin/pip", "install", "-v", "--no-binary", ":all:",
                              "--ignore-installed", buildpath
    system libexec/"bin/pip", "uninstall", "-y", "aws-sam-cli"
    venv.pip_install_and_link buildpath
  end

  test do
    assert_match "Usage", shell_output("#{bin}/sam --help")
  end
end
