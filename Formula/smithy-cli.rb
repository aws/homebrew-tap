# -*- coding: utf-8 -*-
require_relative '../ConfigProvider/config_provider'

class SmithyCli < Formula
    $config_provider = ConfigProvider.new('smithy-cli')
    desc "Smithy CLI - A CLI for building, validating, querying, and iterating on Smithy models"
    homepage "https://smithy.io"
    version $config_provider.version

    if OS.mac?
      if Hardware::CPU.intel?
        url "#{$config_provider.root_url}-darwin-x86_64.tar.gz"
        sha256 $config_provider.sierra_hash
      elsif Hardware::CPU.arm?
        url "#{$config_provider.root_url}-darwin-aarch64.tar.gz"
        sha256 $config_provider.arm64_big_sur_hash
      end
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "#{$config_provider.root_url}-linux-x86_64.tar.gz"
        sha256 $config_provider.linux_hash
      elsif Hardware::CPU.arm?
        url "#{$config_provider.root_url}-linux-aarch64.tar.gz"
        sha256 $config_provider.linux_arm_hash
      end
    end

    def install
        # install everything in archive into libexec, so that
        # the contents are private to homebrew, which means it won't try
        # to symlink anything in this directory automatically
        libexec.install Dir["*"]
        # create a symlink to the private executable
        bin.install_symlink "#{libexec}/bin/smithy" => "smithy"
    end

    def post_install
        # brew relocates dylibs and assigns different ids, which is problematic since
        # we package a runtime image ourselves
        Dir["#{libexec}/**/*.dylib"].each do |dylib|
            chmod 0664, dylib
            MachO::Tools.change_dylib_id(dylib, "@rpath/#{File.basename(dylib)}")
            MachO.codesign!(dylib) if Hardware::CPU.arm?
            chmod 0444, dylib
        end
        # call warmup command to generate the jsa 
        system "#{bin}/#{$config_provider.bin}" " warmup"
    end

    test do
        assert_predicate lib/"#{$config_provider.bin}.jsa", :exist?
        assert_match $config_provider.version, shell_output("#{bin}/#{$config_provider.bin} --version")
        assert_match "Usage: #{$config_provider.bin}", shell_output("#{bin}/#{$config_provider.bin} --help")
    end
end
