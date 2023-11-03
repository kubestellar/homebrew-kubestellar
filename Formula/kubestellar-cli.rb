class KubestellarCli < Formula
  desc "KubeStellar user facing commands and kubectl plugins"
  homepage "https://kubestellar.io"
  version "v0.13.0"

  if OS.mac?
    case Hardware::CPU.arch
    when :arm64
      url "https://github.com/kubestellar/kubestellar/releases/download/v0.13.0/kubestellaruser_v0.13.0_darwin_arm64.tar.gz"
      sha256 "ed3d32c632be4ac7400b88096e585fd71520ae25e70f2d9f88033ec5eb0c9923"  
    when :x86_64
      url "https://github.com/kubestellar/kubestellar/releases/download/v0.13.0/kubestellaruser_v0.13.0_darwin_amd64.tar.gz"
      sha256 "28cf92b9b4db99ea2959b61a91dd3178a655ab35191dd24bff56b5fb2548b535"
    else
      odie "Unsupported architecture on macOS"
    end
  elsif OS.linux?
    case Hardware::CPU.arch
    when :arm64
      url "https://github.com/kubestellar/kubestellar/releases/download/v0.13.0/kubestellaruser_v0.13.0_linux_arm64.tar.gz"
      sha256 "9a4d7b5d0eeb5d3c9a6ae6255b54df37765c2ce3054a146a3e91426da980d0bd"
    when :x86_64
      url "https://github.com/kubestellar/kubestellar/releases/download/v0.13.0/kubestellaruser_v0.13.0_linux_amd64.tar.gz"
      sha256 "f4075ac535680d4b6b6f518b1d3bc84f23d6e99ffbff8309c81f0f9dbdc1d8dc"
    when :ppc64
      url "https://github.com/kubestellar/kubestellar/releases/download/v0.13.0/kubestellaruser_v0.13.0_linux_ppc64le.tar.gz"
      sha256 "7759e2204d5b8193db66bca84a1da60eebdea6d4ecaa850b780263a16e324a4b"
    when :s390x
      url "https://github.com/kubestellar/kubestellar/releases/download/v0.13.0/kubestellaruser_v0.13.0_linux_s390x.tar.gz"
      sha256 "927adada898a8d1f27adb7d921d995cf78362c74dbd5eb2e822b856cba551e66"
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
