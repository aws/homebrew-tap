class AwsSamCli < Formula
  include Language::Python::Virtualenv

  desc "AWS SAM CLI 🐿 is a tool for local development and testing of Serverless applications"
  homepage "https://github.com/awslabs/aws-sam-cli/"
  url "https://files.pythonhosted.org/packages/c7/0f/77f6b432b3b0de79c45afdb5f37a293fa8ca2f2a7b6281ee72557ba88665/aws-sam-cli-0.9.0.tar.gz"
  sha256 "b7dc86871610f20438777e43189a613116569c302fe4bfa054e94d8da3b948fd"
  head "https://github.com/awslabs/aws-sam-cli.git", :branch => "develop"
  bottle :unneeded

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
