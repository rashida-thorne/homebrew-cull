class Cull < Formula
  desc "jq for HTML: select with CSS selectors, shape into JSON, CSV, or Markdown"
  homepage "https://github.com/rashida-thorne/cull"
  version "0.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rashida-thorne/cull/releases/download/v0.9.0/cull-v0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "ca55fecd49c80bbf72b5ce62cfb507d7ba5ca172a2567dd40bfce05dc2b9cd48"
    else
      url "https://github.com/rashida-thorne/cull/releases/download/v0.9.0/cull-v0.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "97409e1c128b9d73996a50c1dcfb8c88a4267b2c8ea2f025406c7fd2909d6e7a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rashida-thorne/cull/releases/download/v0.9.0/cull-v0.9.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "af60f4cb2265c57c5a4696bd4b9e2089ed88650d45019059e188e2a59f585195"
    else
      url "https://github.com/rashida-thorne/cull/releases/download/v0.9.0/cull-v0.9.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "21a694bbece666e6466ee034275b996dbb61a51946c1406da5c69757e2843391"
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
