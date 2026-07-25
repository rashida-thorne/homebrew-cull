class Cull < Formula
  desc "jq for HTML: select with CSS selectors, shape into JSON, CSV, or Markdown"
  homepage "https://github.com/rashida-thorne/cull"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rashida-thorne/cull/releases/download/v0.2.0/cull-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "7b2d12d352c697fc71d6ddcd4dc9d73c23e67a9e87a7d15b2a42e4e44c83f02d"
    else
      url "https://github.com/rashida-thorne/cull/releases/download/v0.2.0/cull-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "804566d5b984091eae027dc3ac8f62e1e271d76e97a3fc3af989d86e12db6702"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rashida-thorne/cull/releases/download/v0.2.0/cull-v0.2.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c9b132cefff459113633e6171367e5b0efb4ec7285995c4221ec8caa31b99769"
    else
      url "https://github.com/rashida-thorne/cull/releases/download/v0.2.0/cull-v0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "12787ab530f842b332e7ac68f157b6665efc256e33197b024b0795840a9aace1"
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
