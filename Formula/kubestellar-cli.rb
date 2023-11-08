class KubestellarCli < Formula
  desc "KubeStellar user facing commands and kubectl plugins"
  homepage "https://kubestellar.io"
  version "v0.14.0"

  if OS.mac?
    case Hardware::CPU.arch
    when :arm64
      url "https://github.com/kubestellar/kubestellar/releases/download/v0.14.0/kubestellaruser_v0.14.0_darwin_arm64.tar.gz"
      sha256 "9701bdbfaac0f91dbb969a6b436e1bddbff126c1ca2d0a4bfd348d9683d0c950"  
    when :x86_64
      url "https://github.com/kubestellar/kubestellar/releases/download/v0.14.0/kubestellaruser_v0.14.0_darwin_amd64.tar.gz"
      sha256 "05b865fb010ecb078e9d2f50005dd5a82e5e0c9dabbe0bd83b52b398d14d6a05"
    else
      odie "Unsupported architecture on macOS"
    end
  elsif OS.linux?
    case Hardware::CPU.arch
    when :arm64
      url "https://github.com/kubestellar/kubestellar/releases/download/v0.14.0/kubestellaruser_v0.14.0_linux_arm64.tar.gz"
      sha256 "6bc1dd5bd6a07e0997cff5487ce845df10cb608981ee989a1bc47727f92c6b61"
    when :x86_64
      url "https://github.com/kubestellar/kubestellar/releases/download/v0.14.0/kubestellaruser_v0.14.0_linux_amd64.tar.gz"
      sha256 "c323d0c82c1feaadf5b529a230bea60682c7dc4ccba8aaccf6ad1da847388869"
    when :ppc64
      url "https://github.com/kubestellar/kubestellar/releases/download/v0.14.0/kubestellaruser_v0.14.0_linux_ppc64le.tar.gz"
      sha256 "59d485ccdcb3913e569b13f96ff45e3783a4c430c93a7e7a0ed8903ea3032a28"
    when :s390x
      url "https://github.com/kubestellar/kubestellar/releases/download/v0.14.0/kubestellaruser_v0.14.0_linux_s390x.tar.gz"
      sha256 "741092990fe7de1c3af2202a9c5b666fc1757a252e65fad17ad773923bd93ccb"
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
