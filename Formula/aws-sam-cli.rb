# -*- coding: utf-8 -*-
class AwsSamCli < Formula
  include Language::Python::Virtualenv

  desc "AWS SAM CLI 🐿 is a tool for local development and testing of Serverless applications"
  homepage "https://github.com/awslabs/aws-sam-cli/"
  url "https://files.pythonhosted.org/packages/9f/f1/124ecc5bedf0f3e7eaaae52d173e82ec25faaf965df76be97635a9d1413d/aws-sam-cli-0.35.0.tar.gz"
  sha256 "1ed43d5ad695c98886128ea376e0a98c37a92f11144b060be1eb052797665b2f"
  head "https://github.com/awslabs/aws-sam-cli.git", :branch => "develop"
  bottle do
    root_url "https://github.com/awslabs/aws-sam-cli/releases/download/v0.35.0/"
    cellar :any_skip_relocation
    sha256 "8e154a4bf52139fbc889146cd68de5768b5e4f3db0b96386b4d1355dad1761ca" => :sierra
    sha256 "a977f749540e552204cf9f33117dbad74fc9b88d7f93f54561d6ac640c24ad39" => :x86_64_linux
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
