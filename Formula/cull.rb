class Cull < Formula
  desc "jq for HTML: select with CSS selectors, shape into JSON, CSV, or Markdown"
  homepage "https://github.com/rashida-thorne/cull"
  version "0.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rashida-thorne/cull/releases/download/v0.12.0/cull-v0.12.0-aarch64-apple-darwin.tar.gz"
      sha256 "b68e17c1a538f150d94dc7fc2852afdf8c5465bc6f9ffc667a17739d3a008e30"
    else
      url "https://github.com/rashida-thorne/cull/releases/download/v0.12.0/cull-v0.12.0-x86_64-apple-darwin.tar.gz"
      sha256 "4cd53b5da9da69739a4576038d3877c6e48ebd5d6a2da04f06c48b5c773af54c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rashida-thorne/cull/releases/download/v0.12.0/cull-v0.12.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1032f49da9fabed2f38cdb95ec5e6260cd9bf6880ab48efec3fdd5714e2a0527"
    else
      url "https://github.com/rashida-thorne/cull/releases/download/v0.12.0/cull-v0.12.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ca4673f68cdcbdaaacce25a785aea5f1cbbcd5c4d003dd5938bc5503dbe201bf"
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
