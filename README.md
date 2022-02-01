# homebrew-tap

Homebrew formulae that allows installation of AWS tools through the [Homebrew](https://brew.sh/) package manager.


## Installation

```
brew tap aws/tap
brew install <FORMULA>
```

## Formulae

| Repository | Formula | Description |
| ---------- | ------- | ----------- |
| [aws-sam-cli](https://github.com/awslabs/aws-sam-cli) | [formula](Formula/aws-sam-cli.rb) | CLI tool to build, test, debug, and deploy Serverless applications using AWS Lambda |
| container-tools | [formula](Formula/container-tools.rb) | Meta-package to install common container tools |
| [copilot-cli](https://github.com/aws/copilot-cli) | [formula](Formula/copilot-cli.rb) | Build, release and operate production ready containerized applications on Amazon ECS |
| [ec2-instance-selector](https://github.com/aws/amazon-ec2-instance-selector) | [formula](Formula/ec2-instance-selector.rb) | CLI tool and go library which recommends instance types based on resource criteria like vcpus and memory |
| [ec2-metadata-mock](https://github.com/aws/amazon-ec2-metadata-mock) | [formula](Formula/ec2-metadata-mock.rb) | A tool to simulate Amazon EC2 instance metadata |
| [eks-anywhere](https://github.com/aws/eks-anywhere) | [formula](Formula/eks-anywhere.rb) | CLI tool for managing Amazon EKS Anywhere clusters |
| k8s-tools | [formula](Formula/k8s-tools.rb) | Meta-package to install common Kubernetes tools |
| [lightsailctl](https://github.com/aws/lightsailctl) | [formula](Formula/lightsailctl.rb) | Amazon Lightsail CLI Extensions |
| [xray-daemon](https://github.com/aws/aws-xray-daemon) | [formula](Formula/xray-daemon.rb) | Relays traffic to AWS X-Ray API |
| [aws-simple-ec2-cli](https://github.com/awslabs/aws-simple-ec2-cli) | [formula](Formula/aws-simple-ec2-cli.rb) | CLI tool that simplifies the process of launching, connecting and terminating EC2 instances |
| [qldbshell](https://github.com/awslabs/amazon-qldb-shell) | [formula](Formula/qldbshell.rb) | A CLI Shell for interacting with and processing queries against AWS QLDB |
| [emr-on-eks-custom-image](https://github.com/awslabs/amazon-emr-on-eks-custom-image-cli) | [formula](Formula/emr-on-eks-custom-image.rb) | A CLI tool to interact with EMR on EKS custom images.
| [Litani](https://github.com/awslabs/aws-build-accumulator) | [formula](Formula/litani.rb) | Litani provides platform-independent job control (timeouts, return code control) and an output format that is easy to render into reports

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh/)
