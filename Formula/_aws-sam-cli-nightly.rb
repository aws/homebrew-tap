require_relative "../ConfigProvider/config_provider"

class AwsSamCliNightly < Formula
  include Language::Python::Virtualenv

  config_provider = ConfigProvider.new("aws-sam-cli-nightly")

  desc "AWS SAM CLI 🐿 is a tool for local development and testing of Serverless applications. This is a pre-release version of AWS SAM CLI"
  homepage "https://github.com/aws/aws-sam-cli/"
  url config_provider.url
  sha256 config_provider.sha256
  head "https://github.com/aws/aws-sam-cli.git", branch: "nightly-builds"

  def self.is_native_binary_supported?
    OS.linux? and Hardware::CPU.intel?
  end

  if AwsSamCliNightly.is_native_binary_supported?
    # instructions for native installer
    on_linux do
      on_intel do
        url config_provider.native_root_url + config_provider.native_linux_x86_file
        sha256 config_provider.native_linux_x86_hash
      end
    end

    def install
      libexec.install Dir["dist/*"]
      bin.write_exec_script libexec/"sam-nightly"
    end
  else
    # instructions for python virtualenv installer
    bottle do
      root_url config_provider.root_url
      sha256 cellar: :any_skip_relocation, sierra:       config_provider.sierra_hash
    end

    depends_on "python@3.8"

    def install
      # https://github.com/Homebrew/brew/pull/15792
      # re-add pip to the virtualenv using without_pip=false
      venv = virtualenv_create(libexec, "python3.8", without_pip:false)
      system libexec/"bin/pip", "install", "--upgrade", "pip"
      system libexec/"bin/pip", "install", "-v", "--ignore-installed", buildpath
      system libexec/"bin/pip", "uninstall", "-y", "aws-sam-cli"
      # bin folder is not created automatically
      bin.mkpath
      venv.pip_install_and_link buildpath
    end
  end  

  test do
    assert_match "Usage", shell_output("#{bin}/sam-nightly --help")
    system bin/"sam-nightly --version"
  end

  opoo "On September 12, 2023, AWS will no longer maintain the Homebrew installer for nightly version of AWS SAM CLI (aws/tap/aws-sam-cli-nightly). 
        For AWS supported installations, use the first-party installers (https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/manage-sam-cli-versions.html#manage-sam-cli-versions-nightly-build)."
end