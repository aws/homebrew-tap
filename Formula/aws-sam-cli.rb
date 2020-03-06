# -*- coding: utf-8 -*-
require_relative '../ConfigProvider/config_provider'

class AwsSamCli < Formula
  include Language::Python::Virtualenv

  config_provider = ConfigProvider.new

  desc "AWS SAM CLI 🐿 is a tool for local development and testing of Serverless applications"
  homepage "https://github.com/awslabs/aws-sam-cli/"
  url config_provider.url()
  sha256 config_provider.sha256
  head "https://github.com/awslabs/aws-sam-cli.git", :branch => "develop"
  bottle do
    root_url config_provider.root_url()
    cellar :any_skip_relocation
    sha256 config_provider.sierra_hash() => :sierra
    sha256 config_provider.linux_hash() => :x86_64_linux
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
