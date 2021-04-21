class Libdvdread < Formula
  desc "C library for reading DVD-video images"
  homepage "https://www.videolan.org/developers/libdvdnav.html"
  url "https://download.videolan.org/pub/videolan/libdvdread/6.1.2/libdvdread-6.1.2.tar.bz2"
  sha256 "cc190f553758ced7571859e301f802cb4821f164d02bfacfd320c14a4e0da763"
  license "GPL-2.0"

  bottle do
    sha256 cellar: :any, arm64_big_sur: "f3c231a59c09540140370ee6702dd708db7f030100da301aed7da7fcc66c46d9"
    sha256 cellar: :any, big_sur:       "732ca22426ca97c3b96a975a3ee25ad12b74de870f58b506f36c7e9b7e91d328"
    sha256 cellar: :any, catalina:      "83bebe58015f6f34973afa003934f183e7ac9202f5e579cfd12536f9ceac1719"
    sha256 cellar: :any, mojave:        "7405838fee2b93209c2bd0834db89c2a2334a94f7d368feb87599da1b08062f6"
    sha256 cellar: :any, high_sierra:   "c881a8c1c872d922f45bf8a692b9d79b5f6ade1a2f4a48d470d05491bc017436"
  end

  head do
    url "https://code.videolan.org/videolan/libdvdread.git"
    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build
  end

  depends_on "libdvdcss"

  def install
    ENV.append "CFLAGS", "-DHAVE_DVDCSS_DVDCSS_H"
    ENV.append "LDFLAGS", "-ldvdcss"

    system "autoreconf", "-if" if build.head?
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
end
