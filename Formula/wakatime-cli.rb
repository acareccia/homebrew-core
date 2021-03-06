class WakatimeCli < Formula
  desc "Command-line interface to the WakaTime api"
  homepage "https://wakatime.com/"
  url "https://pypi.python.org/packages/83/79/ccc7f8ea7b2a8deb9098359bf242654f0097c3bcd6501d7a811ea6eb701d/wakatime-6.0.4.tar.gz"
  sha256 "653fbca6409f426d25388ab8e2691522c8dcad8a2817befd93533089e13fec5c"

  bottle do
    cellar :any_skip_relocation
    sha256 "7157361c0ae358100e29f844046bba95367b3c3f2566c27652f028d16910e04a" => :el_capitan
    sha256 "f16df9dc486332075b1b502be4b393f02f4b9cb0c8511d896ccc8977c4305e7d" => :yosemite
    sha256 "7c5d377f2f08cae33d548cf6773738745d29fe08bd131e4bea394e413ff19703" => :mavericks
  end

  depends_on :python if MacOS.version <= :snow_leopard

  def install
    ENV["PYTHONPATH"] = libexec/"lib/python2.7/site-packages"

    system "python", *Language::Python.setup_install_args(libexec)
    bin.install Dir[libexec/"bin/*"]
    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
  end

  test do
    system "#{bin}/wakatime", "--help"
  end
end
