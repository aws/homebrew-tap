class AwsDdbsh < Formula
  desc "Simple SQL CLI for DynamoDB"
  homepage "https://www.ddbsh.org/"
  url "https://github.com/awslabs/dynamodb-shell.git",
      tag:      "v0.5",
      revision: "150c93c02d36cad77b27e13308525b8b7f55b672"
  license "Apache-2.0"
  depends_on "cmake" => :build
  depends_on "aws-sdk-cpp"

  def install
    system "cmake", "-S", "ddbsh", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "#{bin}/ddbsh", "-c", "quit"
  end
end
