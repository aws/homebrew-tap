# -*- coding: utf-8 -*-
class AwsSamCli < Formula
  include Language::Python::Virtualenv

  desc "AWS SAM CLI 🐿 is a tool for local development and testing of Serverless applications"
  homepage "https://github.com/awslabs/aws-sam-cli/"
  url "https://files.pythonhosted.org/packages/8b/5c/1a91cbfdba59add3defe82e70b2ebd15790ff05f70a92d757476c42e68d1/aws-sam-cli-0.17.0.tar.gz"
  sha256 "95be2293373f323975198f7695eb712d687920d1e376918b54df24d9c4ef1580"
  head "https://github.com/awslabs/aws-sam-cli.git", :branch => "develop"
  bottle do
    root_url "https://github.com/awslabs/aws-sam-cli/releases/download/v0.16.1/"
    cellar :any_skip_relocation
    sha256 "3a03e68f15567d5f15ed559b93a2ac5f8b72315edb98bef779fe52730bfb3698" => :sierra
    sha256 "996ef933e8df93c82ee92c0b5b48b92e9de3318c921c04a926640eda7a72cd94" => :x86_64_linux
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
