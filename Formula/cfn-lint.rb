class CfnLint < Formula
  include Language::Python::Virtualenv

  desc "Validate CloudFormation yaml/json templates against the CloudFormation spec and additional checks."
  homepage "https://github.com/awslabs/cfn-python-lint/"
  url "https://github.com/awslabs/cfn-python-lint/archive/v0.10.0.tar.gz"
  sha256 "40f6cca4acf10099d92fcaf4885c52f52c960246ea4c025b892908bab834f90d"
  head "https://github.com/awslabs/cfn-python-lint.git", :branch => "master"
  bottle :unneeded

  depends_on "python"

  def install
    venv = virtualenv_create(libexec, "python3")
    system libexec/"bin/pip", "install", "-v", "--no-binary", ":all:",
                              "--ignore-installed", buildpath
    system libexec/"bin/pip", "uninstall", "-y", "cfn-lint"
    venv.pip_install_and_link buildpath
  end

  test do
    assert_match "Usage", shell_output("#{bin}/cfn-lint --help")
  end
end
