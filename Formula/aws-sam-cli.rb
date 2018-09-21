class AwsSamCli < Formula
  include Language::Python::Virtualenv

  desc "AWS SAM command line interface"
  homepage "https://github.com/awslabs/aws-sam-cli/"
  url "https://github.com/awslabs/aws-sam-cli/archive/v0.6.0.tar.gz"
  sha256 "f85762aba829525eb8c6a52d354ef7254ed37e5bc8a7389885fd0daebfea1c96"
  head "https://github.com/awslabs/aws-cli.git", :branch => "develop"
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
