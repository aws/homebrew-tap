class AwsSamCli < Formula
  include Language::Python::Virtualenv

  desc "AWS SAM CLI 🐿 is a tool for local development and testing of Serverless applications"
  homepage "https://github.com/awslabs/aws-sam-cli/"
  url "https://files.pythonhosted.org/packages/92/df/3e8c8a65075d810f8f35157d60c06461061f51c3713c47ca3afaef2c5b89/aws-sam-cli-0.15.0.tar.gz"
  sha256 "cdfdb39c1b0fc8925b8e24719d934c2e676cc675b10532d038c1fb90dd8d3786"
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
