class Cull < Formula
  desc "jq for HTML: select with CSS selectors, shape into JSON, CSV, or Markdown"
  homepage "https://github.com/rashida-thorne/cull"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rashida-thorne/cull/releases/download/v0.3.0/cull-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "ba0959fe071415ca668ac2b6a74dbdb983945a166e6639f6b1616dfdfa682e1b"
    else
      url "https://github.com/rashida-thorne/cull/releases/download/v0.3.0/cull-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "b4c2a2113feeff1ed9e0e7164eb66780a2b29d64fe2e47839df979bb3fc46099"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rashida-thorne/cull/releases/download/v0.3.0/cull-v0.3.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "10ff9a8b164faf1a56fe036b5c3ada0aae991217df70bc7bf5a8f5fff4eb415d"
    else
      url "https://github.com/rashida-thorne/cull/releases/download/v0.3.0/cull-v0.3.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "adc6d0bb50b3d051ebeeb46d206d7a9a6e75dd59643d6b245bc28fcf5be61dd7"
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
