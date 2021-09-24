# -*- coding: utf-8 -*-
require_relative '../ConfigProvider/config_provider'

class EmrOnEksCustomImage < Formula

  $config_provider = ConfigProvider.new('amazon-emr-on-eks-custom-image-cli')

  desc "Amazon EMR on EKS Custom Image CLI"
  homepage "https://github.com/awslabs/amazon-emr-on-eks-custom-image-cli"
  version $config_provider.version
  bottle :unneeded
  license "Apache-2.0"

  if OS.mac?
    url "#{$config_provider.root_url}-mac-v1.00.zip"
    sha256 $config_provider.sierra_hash
  end

  if OS.linux?
    url "#{$config_provider.root_url}-linux-v1.00.zip"
    sha256 $config_provider.linux_hash
  end

  def caveats 
   <<~EOF 
       =====WARNING===== 
       This tool utilizes Docker CLI to help validate custom images. 
       Please make sure you have Docker CLI installed prior to using the tool.
   EOF
  end 

  def install
    bin.install "dist/#{$config_provider.bin}"
  end

  test do
    assert_match "Amazon EMR on EKS - Custom Image CLI", shell_output("#{bin}/#{$config_provider.bin}")
  end

end
