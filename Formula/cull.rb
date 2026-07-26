class Cull < Formula
  desc "jq for HTML: select with CSS selectors, shape into JSON, CSV, or Markdown"
  homepage "https://github.com/rashida-thorne/cull"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rashida-thorne/cull/releases/download/v0.6.0/cull-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "b5193bc74b2f4213696b976e3bd53ade59ce0a4088cb132efb522c69ae2a18fd"
    else
      url "https://github.com/rashida-thorne/cull/releases/download/v0.6.0/cull-v0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "469a975f94b979b4cddf1fe706a0e703f7c87e88c6d52bc8b41525c08c32bbbc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rashida-thorne/cull/releases/download/v0.6.0/cull-v0.6.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0a0beea72a78044d3fba080900945b3f0baaab069cd9809091fbaa73940fa4b1"
    else
      url "https://github.com/rashida-thorne/cull/releases/download/v0.6.0/cull-v0.6.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ea7285487137643d33d9e6c7a27893e90fa4248c74ce335368f271e533bec8a8"
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
