class AwsCfnLint < Formula
  include Language::Python::Virtualenv

  desc "AWS cfn-lint is a tool to lint CloudFormation templates locally"
  homepage "https://github.com/aws-cloudformation/cfn-python-lint/"
  url "https://files.pythonhosted.org/packages/19/eb/2515f1915a7fa14d30dd31217a42faade80553265940d1b8a9be2d59b677/cfn-lint-0.19.1.tar.gz"
  sha256 "5a723ff791fc23aced78e9cde28f18f9eeae9a24f91db2b7a20f7aa837a613b3"
  head "https://github.com/aws-cloudformation/cfn-python-lint.git", :branch => "master"
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
