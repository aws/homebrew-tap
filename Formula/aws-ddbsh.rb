class AwsDdbsh < Formula
  desc "Simple SQL CLI for DynamoDB"
  homepage "https://www.ddbsh.org/"
  url "https://github.com/awslabs/dynamodb-shell.git",
      tag:      "v5.0",
      revision: "09e900a1cb5c111fa1cc5d772c5d2230fda9ce0f"
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
