class KubestellarCli < Formula
  desc "KubeStellar user facing commands and kubectl plugins"
  homepage "https://kubestellar.io"
  version "v0.12.0"

  if OS.mac?
    case Hardware::CPU.arch
    when :arm64
      url "https://github.com/kubestellar/kubestellar/releases/download/v0.12.0/kubestellaruser_v0.12.0_darwin_arm64.tar.gz"
      sha256 "9bed01d0e6fd608eab560659f8b60415296a6e07d5b1661613064f7e98f89ce5"  
    when :x86_64
      url "https://github.com/kubestellar/kubestellar/releases/download/v0.12.0/kubestellaruser_v0.12.0_darwin_amd64.tar.gz"
      sha256 "748c7cf7913884acff8bfec45509603f1468002ce82ee5454ae11592527c2661"
    else
      odie "Unsupported architecture on macOS"
    end
  elsif OS.linux?
    case Hardware::CPU.arch
    when :arm64
      url "https://github.com/kubestellar/kubestellar/releases/download/v0.12.0/kubestellaruser_v0.12.0_linux_arm64.tar.gz"
      sha256 "8a9db7a9b382905c5e18f20b46d21c2300b29f19fed51e82972b54195e8a0061"
    when :x86_64
      url "https://github.com/kubestellar/kubestellar/releases/download/v0.12.0/kubestellaruser_v0.12.0_linux_amd64.tar.gz"
      sha256 "9a8a87f53e24cdb52ec4f5b5c69cf093a91cb882122b75ac4aa4040dcd2b48a8"
    when :ppc64
      url "https://github.com/kubestellar/kubestellar/releases/download/v0.12.0/kubestellaruser_v0.12.0_linux_ppc64le.tar.gz"
      sha256 "980c4b1524e7f0504522bc173902ea9ab52d3b1edfed20dbc5bb1ace55b09519"
    when :s390x
      url "https://github.com/kubestellar/kubestellar/releases/download/v0.12.0/kubestellaruser_v0.12.0_linux_s390x.tar.gz"
      sha256 "fd9f68a1f1d3a1d6680b3134dff3c84830c8057e5f0213a8b0882d8eb9c87442"
    else
      odie "Unsupported architecture on Linux"
    end
  else
    odie "Unsupported operating system"
  end

  license "Apache-2.0"

  if system("which kubectl &> /dev/null")
    depends_on "kubectl"
  end

  def install
    prefix.install Dir["*"]
  end

  def post_install
    puts "\e[1;37mKubeStellar user commands and kubectl plugins have been installed to '#{prefix}' and are symlinked to '#{HOMEBREW_PREFIX}/bin'\e[0m"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test kubestellar cli`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
