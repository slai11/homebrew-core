class GotoRs < Formula
  desc "Jumps to your project directory in a simple and deterministic manner"
  homepage "https://github.com/slai11/goto"
  url "https://github.com/slai11/goto/archive/v0.2.2.tar.gz"
  sha256 "7915443e2039f010a83aedb2b9060967b8aeec87f2405c617a0d179c68928f4f"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked",
                               "--root", prefix,
                               "--path", "."
  end

  test do
    mkdir "folderA"
    mkdir "folderB"
    system "#{bin}/goto-rs", "add", "-a"
    assert_match /fol/, shell_output("#{bin}/goto-rs ls")
  end
end
