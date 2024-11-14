class AwsDdbsh < Formula
  desc "Simple SQL CLI for DynamoDB"
  homepage "https://www.ddbsh.org/"
  url "https://github.com/awslabs/dynamodb-shell.git",
      tag:      "v0.8.1",
      revision: "d54cf487136e8370dd93591595402a5658477c15"
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
