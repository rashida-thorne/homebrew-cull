class Cull < Formula
  desc "jq for HTML: select with CSS selectors, shape into JSON, CSV, or Markdown"
  homepage "https://github.com/rashida-thorne/cull"
  version "0.11.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rashida-thorne/cull/releases/download/v0.11.2/cull-v0.11.2-aarch64-apple-darwin.tar.gz"
      sha256 "01057566cf3f3363b6d984e04edcdba4c77d470153e070382400d7aa6aadc849"
    else
      url "https://github.com/rashida-thorne/cull/releases/download/v0.11.2/cull-v0.11.2-x86_64-apple-darwin.tar.gz"
      sha256 "68b1335d2c29c75980ba658cb999e05ff90d401f57538a6f7931c815f387df4a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rashida-thorne/cull/releases/download/v0.11.2/cull-v0.11.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ed598c504ed5a1e229f63c76cdcbcbc7c1942d1d67ecd4aa2046b5b3f6570e1b"
    else
      url "https://github.com/rashida-thorne/cull/releases/download/v0.11.2/cull-v0.11.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a2628b9385d47abcc4c4ff6fb538748f8565888a7eb4f7db99a15bffd56ec91e"
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
