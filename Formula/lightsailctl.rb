# -*- coding: utf-8 -*-
require_relative '../ConfigProvider/config_provider'

class Lightsailctl < Formula
    $config_provider = ConfigProvider.new("lightsailctl")

    desc     "Amazon Lightsail CLI Extensions"
    homepage "https://github.com/aws/lightsailctl"
    license  "Apache-2.0"
    version  $config_provider.version
    url      $config_provider.url
    sha256   $config_provider.sha256
    head     "https://github.com/aws/lightsailctl.git", branch: "main"

    depends_on "go" => :build

    def install
        system "go", "build", "-trimpath", "-o", bin/$config_provider.bin, "cmd/lightsailctl/main.go"
    end

    test do
        assert_match "Usage of", shell_output("#{bin}/#{$config_provider.bin} --plugin --help 2>&1")
    end
end
