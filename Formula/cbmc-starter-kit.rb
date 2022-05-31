class CbmcStarterKit < Formula
  include Language::Python::Virtualenv

  desc "Templates for writing CBMC proofs for C code"
  homepage "https://github.com/model-checking/cbmc-starter-kit"
  url "https://github.com/model-checking/cbmc-starter-kit.git",
      tag:      "starterkit-2.3",
      revision: "b0ae0315dbad8e6115bb4d797f90813cbf00aa7d"
  license "MIT-0"

  bottle do
    root_url "https://github.com/model-checking/cbmc-starter-kit/releases/download/starterkit-2.3"
    sha256 cellar: :any_skip_relocation, big_sur:      "a7fe739395e3f885e0ed46eca38d7eba23c435e2a5237e9cfc7b0ab7d9d62df4"
    sha256 cellar: :any_skip_relocation, catalina:     "df9d90e1f6f00b8b268d173904ef6d891b98ad6cf1c57db04c340b3864696a56"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "bdb59aa0f8dfd3931acbc29fe161e22287d680a778c468b01781c6b4e8cfa01e"
  end

  depends_on "python@3.8"

  resource "gitdb" do
    url "https://files.pythonhosted.org/packages/fc/44/64e02ef96f20b347385f0e9c03098659cb5a1285d36c3d17c56e534d80cf/gitdb-4.0.9.tar.gz"
    sha256 "bac2fd45c0a1c9cf619e63a90d62bdc63892ef92387424b855792a6cabe789aa"
  end

  resource "GitPython" do
    url "https://files.pythonhosted.org/packages/d6/39/5b91b6c40570dc1c753359de7492404ba8fe7d71af40b618a780c7ad1fc7/GitPython-3.1.27.tar.gz"
    sha256 "1c885ce809e8ba2d88a29befeb385fcea06338d3640712b59ca623c220bb5704"
  end

  resource "smmap" do
    url "https://files.pythonhosted.org/packages/21/2d/39c6c57032f786f1965022563eec60623bb3e1409ade6ad834ff703724f3/smmap-5.0.0.tar.gz"
    sha256 "c840e62059cd3be204b0c9c9f74be2c09d5648eddd4580d9314c3ecde0b30936"
  end

  def install
    virtualenv_install_with_resources
    bash_completion.install "src/cbmc_starter_kit/etc/bash_completion.d/cbmc-starter-kit.sh"
  end

  test do
    system bin/"cbmc-starter-kit-update --version"
  end
end
