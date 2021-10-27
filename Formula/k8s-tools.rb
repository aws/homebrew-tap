class K8sTools < Formula
    desc "Meta Package for common Kubernetes tools"
    version "1.0.1"
    homepage "https://github.com/aws/homebrew-tap"
    url "file:///dev/null"
    sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"

    depends_on "aws/tap/container-tools"
    depends_on "cdk8s"
    depends_on "helm"
    depends_on "k9s"
    depends_on "kind"
    depends_on "kops"
    depends_on "kustomize"

    def install
        (bin+"awsk8stools").write <<-EOS
            #!/bin/sh

            echo "Kubernetes tools installed"
        EOS
    end
end
