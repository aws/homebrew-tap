class QldbShell < Formula

  $config_provider = ConfigProvider.new('aws-simple-ec2-cli')

  desc "A CLI for interacting with QLDB ledgers"
  homepage "https://github.com/awslabs/amazon-qldb-shell"
  version $config_provider.version
  bottle :unneeded

  if OS.mac?
    url "#{$config_provider.root_url}v#{$config_provider.version}/#{$config_provider.bin}-mac.tar.gz"
    sha256 $config_provider.sierra_hash
  end

  def install
    bin.install $config_provider.bin
  end
end
