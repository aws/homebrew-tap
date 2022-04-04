require_relative "../ConfigProvider/config_provider"

class AwsSamCliNightly < Formula
  include Language::Python::Virtualenv

  config_provider = ConfigProvider.new("aws-sam-cli-nightly")

  desc "AWS SAM CLI 🐿 is a tool for local development and testing of Serverless applications. This is a pre-release version of AWS SAM CLI"
  homepage "https://github.com/aws/aws-sam-cli/"
  url config_provider.url
  sha256 config_provider.sha256
  head "https://github.com/aws/aws-sam-cli.git", branch: "nightly-builds"

  bottle do
    root_url config_provider.root_url
    sha256 cellar: :any_skip_relocation, sierra:       config_provider.sierra_hash
    sha256 cellar: :any_skip_relocation, x86_64_linux: config_provider.linux_hash
  end

  depends_on "python@3.8"

  def install
    venv = virtualenv_create(libexec, "python3.8")
    system libexec/"bin/pip", "install", "--upgrade", "pip"
    system libexec/"bin/pip", "install", "-v", "--ignore-installed", buildpath
    system libexec/"bin/pip", "uninstall", "-y", "aws-sam-cli"
    # bin folder is not created automatically
    bin.mkpath
    venv.pip_install_and_link buildpath
  end

  test do
    assert_match "Usage", shell_output("#{bin}/sam-nightly --help")
  end
end
