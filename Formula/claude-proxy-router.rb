class ClaudeProxyRouter < Formula
  desc "Route Anthropic API requests to the local Claude account with the most headroom"
  homepage "https://github.com/choiyounggi/claude-proxy-router"
  url "https://registry.npmjs.org/claude-proxy-router/-/claude-proxy-router-0.2.1.tgz"
  sha256 "94fdb0c92c61a17c0f2e025015fe3300743dc373584b2716c2ba975dd533a20a"
  license "MIT"

  depends_on :macos
  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  service do
    run [opt_bin/"claude-proxy-router", "start"]
    keep_alive true
    log_path var/"log/claude-proxy-router.log"
    error_log_path var/"log/claude-proxy-router.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claude-proxy-router --version")
    assert_match "unreachable", shell_output("#{bin}/claude-proxy-router ping http://127.0.0.1:1 x", 1)
  end
end
