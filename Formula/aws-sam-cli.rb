class AwsSamCli < Formula
  include Language::Python::Virtualenv

  desc "AWS SAM CLI 🐿 is a tool for local development and testing of Serverless applications"
  homepage "https://github.com/awslabs/aws-sam-cli/"
  url "https://files.pythonhosted.org/packages/d1/17/934d213e62a0c2943eb23a797bc334d7863198d86c5c0e8706dd236c5b67/aws-sam-cli-0.11.0.tar.gz"
  sha256 "c2b383d4830d0efbdf10c29891ff51aea36bce7a54b5341eb21049fd6ebc6422"
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
