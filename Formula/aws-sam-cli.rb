# -*- coding: utf-8 -*-
class AwsSamCli < Formula
  include Language::Python::Virtualenv

  desc "AWS SAM CLI 🐿 is a tool for local development and testing of Serverless applications"
  homepage "https://github.com/awslabs/aws-sam-cli/"
  url "https://files.pythonhosted.org/packages/9a/93/cca11d4f2e33f40d528da2c5f9d9b769943532c8c490e34caf7f52b1f360/aws-sam-cli-0.31.1.tar.gz"
  sha256 "731c98dc88029bbe9f6734afbeedb2c105b86bf4177de1518c82847ec619002b"
  head "https://github.com/awslabs/aws-sam-cli.git", :branch => "develop"
  bottle do
    root_url "https://github.com/awslabs/aws-sam-cli/releases/download/v0.31.0/"
    cellar :any_skip_relocation
    sha256 "ab33b95e7853c59b78a108a8ec2fbe513df476ae2674d94ee777284c9d210fd5" => :sierra
    sha256 "5e16950f812f2cb14aa01cc76e48a90f1e66e5c8bbb23f19b416c04bb884d950" => :x86_64_linux
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
