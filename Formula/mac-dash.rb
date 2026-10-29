class MacDash < Formula
  include Language::Python::Shebang

  desc "Real-time CPU/GPU/memory TUI dashboard for macOS"
  homepage "https://github.com/wonwoo89/mac-dash"
  url "https://github.com/wonwoo89/mac-dash/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "a763ef6ea586ea4528dc2b1fd461735c99b5acb78740def574e6a273bc1546bd"
  license "MIT"

  depends_on :macos
  depends_on "python@3.15"

  def install
    rewrite_shebang detected_python_shebang, "mac-dash.py"
    bin.install "mac-dash.py" => "mac-dash"
  end

  def caveats
    <<~EOS
      For CPU/GPU frequency, power, temperature and fan panels, also install macmon:
        brew install macmon
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mac-dash --version")
    assert_match "memory used", shell_output("#{bin}/mac-dash --once --no-macmon --lang en")
  end
end
