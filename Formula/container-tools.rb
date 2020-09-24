class AwsContainerTools < Formula
    desc "Meta Package for common AWS Container tools"
    url "file:///dev/null"
    sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"

    depends_on "awscli"
    depends_on "eksctl"
    depends_on "kubernetes-cli"
    depends_on "aws/tap/copilot-cli"
    depends_on "aws-iam-authenticator"
    depends_on "docker-credential-helper-ecr"

    def install
        (bin+"awscontainertools").write <<-EOS.endent
            #!/bin/sh

            echo "AWS Container Tools installed"
        EOS
    end
end