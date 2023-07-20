require_relative "../ConfigProvider/config_provider"

class AwsSamCli < Formula
  include Language::Python::Virtualenv

  config_provider = ConfigProvider.new("aws-sam-cli")

  desc "AWS SAM CLI 🐿 is a tool for local development and testing of Serverless applications"
  homepage "https://github.com/awslabs/aws-sam-cli/"
  url config_provider.url
  sha256 config_provider.sha256
  head "https://github.com/awslabs/aws-sam-cli.git", branch: "develop"

  conflicts_with "aws-sam-cli-rc", because: "both install the 'sam' binary"

  def self.is_native_binary_supported?
    OS.linux? and Hardware::CPU.intel?
  end

  if AwsSamCli.is_native_binary_supported?
    # instructions for native installer
    on_linux do
      on_intel do
        url config_provider.native_root_url + config_provider.native_linux_x86_file
        sha256 config_provider.native_linux_x86_hash
      end
    end

    def install
      libexec.install Dir["dist/*"]
      bin.write_exec_script libexec/"sam"
    end
  else
    # instructions for python virtualenv installer
    bottle do
      root_url config_provider.root_url
      sha256 cellar: :any_skip_relocation, sierra:       config_provider.sierra_hash
    end

    depends_on "python@3.8"

    def install
      venv = virtualenv_create(libexec, "python3.8")
      system libexec/"bin/pip", "install", "--upgrade", "pip"
      system libexec/"bin/pip", "install", "-v", "--ignore-installed", buildpath
      system libexec/"bin/pip", "uninstall", "-y", "aws-sam-cli"
      venv.pip_install_and_link buildpath
    end
  end

  test do
    assert_match "Usage", shell_output("#{bin}/sam --help")
    system bin/"sam --version"
  end
end
