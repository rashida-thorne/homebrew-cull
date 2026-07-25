class Cull < Formula
  desc "jq for HTML: select with CSS selectors, shape into JSON, CSV, or Markdown"
  homepage "https://github.com/rashida-thorne/cull"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rashida-thorne/cull/releases/download/v0.5.0/cull-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "b21979b1b969ae483eb113e96aaa940618d77655c1ba8f3682bdb8b90e9c39df"
    else
      url "https://github.com/rashida-thorne/cull/releases/download/v0.5.0/cull-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "3fad0fa3cdf01a44c1dbc83052fa7dc42fc25d0a5f641ae704cff8b2f6f379b3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rashida-thorne/cull/releases/download/v0.5.0/cull-v0.5.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c334ca694452a3b2a426f2b39223339b7cf2d3bc0fd5c0bbf15793627025d34d"
    else
      url "https://github.com/rashida-thorne/cull/releases/download/v0.5.0/cull-v0.5.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b96cff09cad3f18b7ed706b8c2f135ba03127471cf1a898806720d1657f97ee4"
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
