class Cull < Formula
  desc "jq for HTML: select with CSS selectors, shape into JSON, CSV, or Markdown"
  homepage "https://github.com/rashida-thorne/cull"
  version "0.11.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rashida-thorne/cull/releases/download/v0.11.1/cull-v0.11.1-aarch64-apple-darwin.tar.gz"
      sha256 "716b6e70de0c98b3b3bce596785ffc487398e693f008285447c7f755655e9b56"
    else
      url "https://github.com/rashida-thorne/cull/releases/download/v0.11.1/cull-v0.11.1-x86_64-apple-darwin.tar.gz"
      sha256 "77c5fb53dbdb544aef5fc7c2543384f0825e2ab631abee12321d88dcc80915ad"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rashida-thorne/cull/releases/download/v0.11.1/cull-v0.11.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ca3e73927e46e90e03b043d7e7278147393975e35f898c866f068bd79530e4bc"
    else
      url "https://github.com/rashida-thorne/cull/releases/download/v0.11.1/cull-v0.11.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8fe8ed7aae3b00d08b413ae4eec7fe653b7e3c300c4e1e01478549537ec35b4f"
    end
  end

  def install
    bin.install "cull"
    man1.install "cull.1"
    bash_completion.install "completions/cull.bash" => "cull"
    zsh_completion.install "completions/cull.zsh" => "_cull"
    fish_completion.install "completions/cull.fish"
  end

  test do
    assert_equal "hi", pipe_output("#{bin}/cull h1 -t", "<html><h1>hi</h1></html>").strip
  end
end
