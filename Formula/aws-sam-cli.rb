class AwsSamCli < Formula
  include Language::Python::Virtualenv

  desc "AWS SAM CLI 🐿 is a tool for local development and testing of Serverless applications"
  homepage "https://github.com/awslabs/aws-sam-cli/"
  url "https://files.pythonhosted.org/packages/46/c0/668f525b97032e63dc6b2ab28d1ec9fbb67385b9a0a072aeb539b0e073cd/aws-sam-cli-0.16.0.tar.gz"
  sha256 "5bc26ef0aec5b89525c28feaac348de588785ff4d6a9d32289a91dbb41ffd39c"
  head "https://github.com/awslabs/aws-sam-cli.git", :branch => "develop"

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
