class Cull < Formula
  desc "jq for HTML: select with CSS selectors, shape into JSON, CSV, or Markdown"
  homepage "https://github.com/rashida-thorne/cull"
  version "0.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rashida-thorne/cull/releases/download/v0.10.0/cull-v0.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "ee40db79ccd59fb9536b47f2a8179cd61453cbda9a432a736abd48cf207df6a7"
    else
      url "https://github.com/rashida-thorne/cull/releases/download/v0.10.0/cull-v0.10.0-x86_64-apple-darwin.tar.gz"
      sha256 "9643f9a53ce62cf781db592a6d29e8008491e8b75be4d117c866067b4d7a42a3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rashida-thorne/cull/releases/download/v0.10.0/cull-v0.10.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "08b2935d034ec901e7d949cd1ade9d797d4924fa0b9b0502c989406194da82cd"
    else
      url "https://github.com/rashida-thorne/cull/releases/download/v0.10.0/cull-v0.10.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9d674008ea8fabd99f7978a69cffc0c9cd5bc6e7533564944ab1a175e8db7f1b"
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
