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
| k8s-tools | [formula](Formula/k8s-tools.rb) | Meta-package to install common Kubernetes tools |
| [xray-daemon](https://github.com/aws/aws-xray-daemon) | [formula](Formula/xray-daemon.rb) | Relays traffic to AWS X-Ray API |

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh/)
