class CbmcStarterKit < Formula
  include Language::Python::Virtualenv

  desc "Templates for writing CBMC proofs for C code"
  homepage "https://github.com/model-checking/cbmc-starter-kit"
  url "https://github.com/model-checking/cbmc-starter-kit.git",
      tag:      "starterkit-2.0.3",
      revision: "789a974d0701eb292fb8f5c94a6cbab2c3835661"
  license "MIT-0"

  bottle do
    root_url "https://github.com/model-checking/cbmc-starter-kit/releases/download/starterkit-2.0.3"
    sha256 cellar: :any_skip_relocation, big_sur:      "2652e1076dadfa691b1851c8934460cb91bfef16bedb4d3e42700434f686012a"
    sha256 cellar: :any_skip_relocation, catalina:     "703f4b5157337be1ef08fc1eb0ed5fee3d8a5356bdc91c87b651de155b04a1fc"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0e6f66a497dbc8f6860f3b5486f01f7fcacef0335f6f5e6c5097b61ce7895750"
  end

  depends_on "python@3.9"

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
    bash_completion.install "etc/bash_completion.d/cbmc-starter-kit.sh"
  end

  test do
    system bin/"cbmc-starter-kit-update --version"
  end
end
