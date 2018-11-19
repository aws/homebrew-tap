class AwsSamCli < Formula
  include Language::Python::Virtualenv

  desc "AWS SAM CLI 🐿 is a tool for local development and testing of Serverless applications"
  homepage "https://github.com/awslabs/aws-sam-cli/"
  url "https://files.pythonhosted.org/packages/b2/e6/c870d03c58aaa446ebd025384f30e7e0b2b8ab2fcefaace4cb631c7565e1/aws-sam-cli-0.7.0.tar.gz"
  sha256 "56ceeb79dd9fe5c00211f1f8bb81aeb2b809d11abe699a0ac8a1b017d9af0933"
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
