class KubestellarCli < Formula
  desc "KubeStellar user facing commands and kubectl plugins"
  homepage "https://kubestellar.io"
  version "v0.10.0"

  if OS.mac?
    case Hardware::CPU.arch
    when :x86_64
      url "https://github.com/kubestellar/kubestellar/releases/download/v0.10.0/kubestellaruser_v0.10.0_darwin_amd64.tar.gz"
      sha256 "3fa1d88fd221b2d12aba0b9e81cb04f7f571f8ca15ecf785cba8278d1f0e0724"
    when :arm64
      url "https://github.com/kubestellar/kubestellar/releases/download/v0.10.0/kubestellaruser_v0.10.0_darwin_arm64.tar.gz"
      sha256 "3ea093a9e1ca16dda2b2bc554c55dccfbccf8554220477a06fbd41dae86f5608"  
    else
      odie "Unsupported architecture on macOS"
    end
  elsif OS.linux?
    case Hardware::CPU.arch
    when :x86_64
      url "https://github.com/kubestellar/kubestellar/releases/download/v0.10.0/kubestellaruser_v0.10.0_linux_amd64.tar.gz"
      sha256 "e074588b7d4a786069d6183dbffea4b5ec27dda583c1fb49358694d4aaada5f3"
    when :arm64
      url "https://github.com/kubestellar/kubestellar/releases/download/v0.10.0/kubestellaruser_v0.10.0_linux_arm64.tar.gz"
      sha256 "fb5a47f8d67b1427f7e030ba9340022a185012ffcfcd9af8cf81ac4370109da7"
    when :s390x
      url "https://github.com/kubestellar/kubestellar/releases/download/v0.10.0/kubestellaruser_v0.10.0_linux_s390x.tar.gz"
      sha256 "e64466a6de0f40f7e7455deba5be5843582eb30d56cd23ae0bb6efe8f94c6e89"
    when :ppc64
      url "https://github.com/kubestellar/kubestellar/releases/download/v0.10.0/kubestellaruser_v0.10.0_linux_ppc64le.tar.gz"
      sha256 "105a1dea6ec5e9c01be2cd55be563898255c644484e0c690613b081c02ca2368"
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
