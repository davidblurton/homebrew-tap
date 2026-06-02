class Dt < Formula
  desc "Manage dtach sessions by name"
  homepage "https://github.com/davidblurton/dt"
  url "https://github.com/davidblurton/dt/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "d4656ccf7bbef5010cba906f637d4450b96fe0795e0974efae10ebe91bffd8ca"
  license "MIT"
  head "https://github.com/davidblurton/dt.git", branch: "main"

  depends_on "dtach"

  def install
    bin.install "bin/dt"
    bash_completion.install "completions/dt.bash" => "dt"
    zsh_completion.install "completions/dt.zsh" => "_dt"
    fish_completion.install "completions/dt.fish" => "dt.fish"
  end

  test do
    ENV["DT_DIR"] = testpath/"sessions"
    assert_equal "no sessions", shell_output("#{bin}/dt ls").strip
  end
end
