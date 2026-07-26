class Cull < Formula
  desc "jq for HTML: select with CSS selectors, shape into JSON, CSV, or Markdown"
  homepage "https://github.com/rashida-thorne/cull"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rashida-thorne/cull/releases/download/v0.8.0/cull-v0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "7f6f4df3bd172cdbf79afc8cf418152ae82c651f8de75e85b03055093c67b8c8"
    else
      url "https://github.com/rashida-thorne/cull/releases/download/v0.8.0/cull-v0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "76e0596b8c711a5d550a4d026ea35e30a69c7e12845c4b743a5fc0fe25efe364"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rashida-thorne/cull/releases/download/v0.8.0/cull-v0.8.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "693102de10ffa0875884818b77a8fde186a7ea7975e6f8831622beff42ac8c21"
    else
      url "https://github.com/rashida-thorne/cull/releases/download/v0.8.0/cull-v0.8.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d7686ffccc2af41068888104b530b3a5cb8ca37aa9dbc177e27d36dbc2e3391d"
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
