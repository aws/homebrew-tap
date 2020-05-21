# -*- coding: utf-8 -*-
require_relative '../ConfigProvider/config_provider'

class Ec2MetadataMock < Formula

  $config_provider = ConfigProvider.new('ec2-metadata-mock')

  desc "EC2 Metadata Mock is a testing tool to mock out the EC2 Instance Metadata Service"
  homepage "https://github.com/aws/amazon-ec2-metadata-mock/"
  url $config_provider.url()
  sha256 $config_provider.sha256
  head "https://github.com/aws/amazon-ec2-metadata-mock.git", :branch => "master"
  bottle do
    root_url $config_provider.root_url()
    cellar :any_skip_relocation
  end

  depends_on "go" => :build

  def install
    system "VERSION=v#{$config_provider.version} make compile"
    bin.install "build/ec2-metadata-mock"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/ec2-metadata-mock --help")
  end
end
