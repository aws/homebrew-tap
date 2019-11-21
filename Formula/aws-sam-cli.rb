# -*- coding: utf-8 -*-
class AwsSamCli < Formula
  include Language::Python::Virtualenv

  desc "AWS SAM CLI 🐿 is a tool for local development and testing of Serverless applications"
  homepage "https://github.com/awslabs/aws-sam-cli/"
  url "https://files.pythonhosted.org/packages/53/cb/f1805655d22bc98e527273d823b0152d0b0fa128e8c40195f9219ea5e76c/aws-sam-cli-0.32.0.tar.gz"
  sha256 "214379ac66693903390b40739179a90e0d6520d0782a055001905da78955df1c"
  head "https://github.com/awslabs/aws-sam-cli.git", :branch => "develop"
  bottle do
    root_url "https://github.com/awslabs/aws-sam-cli/releases/download/v0.31.1/"
    cellar :any_skip_relocation
    sha256 "4486ce54b184452fe72b82e329b1345ae1bc1419961ecdbf59d3165c12b53b0a" => :sierra
    sha256 "9a81269b183e5b2d585bf7de4c308702a24ddd60e6a4f69b6860aa08f9207e22" => :x86_64_linux
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
