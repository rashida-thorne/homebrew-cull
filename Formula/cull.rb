class Cull < Formula
  desc "jq for HTML: select with CSS selectors, shape into JSON, CSV, or Markdown"
  homepage "https://github.com/rashida-thorne/cull"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rashida-thorne/cull/releases/download/v0.1.0/cull-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "918d7498daf3dea9fa690dd9663e58d2da2d62b0b97bb9e4eaf397f08ecbb33e"
    else
      url "https://github.com/rashida-thorne/cull/releases/download/v0.1.0/cull-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "3530008cf4711d1260f5c176b97e73ed11ef316b171cd502a0818c83c6b089eb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rashida-thorne/cull/releases/download/v0.1.0/cull-v0.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4f2029f794bd086f410bf9a9e763eae2bdbaa3019d1d2565b56b6b348d062f84"
    else
      url "https://github.com/rashida-thorne/cull/releases/download/v0.1.0/cull-v0.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "dfbc7398bc07a41f54422a6431df87c4869d4ff1690c477614d7586a56c1f383"
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
