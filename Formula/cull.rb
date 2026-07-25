class Cull < Formula
  desc "jq for HTML: select with CSS selectors, shape into JSON, CSV, or Markdown"
  homepage "https://github.com/rashida-thorne/cull"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rashida-thorne/cull/releases/download/v0.4.0/cull-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "bafaf2988f53cbf6e52840efb2cdaca63bd732eb72eceee62bd0ecca4c99292e"
    else
      url "https://github.com/rashida-thorne/cull/releases/download/v0.4.0/cull-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "184693d4fe103cb87891c6c49c8bd53d2189299fd942a2457e9fd2fbeaeeccb5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rashida-thorne/cull/releases/download/v0.4.0/cull-v0.4.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b9ab6b3c1779d2283f33debc3dc0a4746ad14ac1f1734437df6ea6f5691c4e56"
    else
      url "https://github.com/rashida-thorne/cull/releases/download/v0.4.0/cull-v0.4.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0aab25136d1f02f00783667642152ee84c63563b1b46858e33d451e7f514b336"
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
