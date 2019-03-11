class AwsSamCli < Formula
  include Language::Python::Virtualenv

  desc "AWS SAM CLI 🐿 is a tool for local development and testing of Serverless applications"
  homepage "https://github.com/awslabs/aws-sam-cli/"
  url "https://files.pythonhosted.org/packages/08/bc/2f80c1351abe15147a7e50ee65a820a1df955989b594921143c50b76511a/aws-sam-cli-0.13.0.tar.gz"
  sha256 "3a0cc1755b5cb21e9e30507b9ef0e52376ff94c0ac2e13b320fe742591b26bd2"
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
