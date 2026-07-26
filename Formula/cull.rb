class Cull < Formula
  desc "jq for HTML: select with CSS selectors, shape into JSON, CSV, or Markdown"
  homepage "https://github.com/rashida-thorne/cull"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rashida-thorne/cull/releases/download/v0.7.0/cull-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "e081b06be512a3b6b33cdcc8da31f1b238a3a24cc30cc9fada4f646e9671eafe"
    else
      url "https://github.com/rashida-thorne/cull/releases/download/v0.7.0/cull-v0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "8d625f20594ee0c2e35ca017fe838d8f10160a78b5cca9c897c80b28c031c592"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rashida-thorne/cull/releases/download/v0.7.0/cull-v0.7.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3d1f42efaaf80e22bb469b06eae7636211fe94384ac73df4dadba2f3df235776"
    else
      url "https://github.com/rashida-thorne/cull/releases/download/v0.7.0/cull-v0.7.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f907e026036ab8a8be3daebdb1e2b3954085d55dc321eda9b1b4ba8911825d1d"
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
