class GotoRs < Formula
  version 'v0.2.1'
  desc "Jumps to your project directory in a simple and deterministic manner."
  homepage "https://github.com/slai11/goto"
  url "https://github.com/slai11/goto/archive/v0.2.1.tar.gz"
  sha256 "1b814b8322b6024a0353977c212697128658fa5b40a3fa34237ca37571ed9afe"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked",
                               "--root", prefix,
                               "--path", "."
  end

  test do
    mkdir "folderA"
    mkdir "folderB"
    system "#{bin}/goto-rs", "add -a"
    assert_match /folderA/, shell_output("#{bin}/goto-rs ls")
  end
end
