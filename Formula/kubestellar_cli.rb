class KubestellarCli < Formula
  desc "KubeStellar user facing commands and kubectl plugins"
  homepage "https://kubestellar.io"
  version "v0.11.0"

  if OS.mac?
    case Hardware::CPU.arch
    when :arm64
      url "https://github.com/kubestellar/kubestellar/releases/download/v0.11.0/kubestellaruser_v0.11.0_darwin_arm64.tar.gz"
      sha256 "5be4c0b676e8a4f5985d09f2cfe6c473bd2f56ebd3ef4803ca345e6f04d83d6b"  
    when :x86_64
      url "https://github.com/kubestellar/kubestellar/releases/download/v0.11.0/kubestellaruser_v0.11.0_darwin_amd64.tar.gz"
      sha256 "a79b3ad7edc996e6bf65884020c0ae2b40d8d8cdb3ec6b200594fe602b920c75"
    else
      odie "Unsupported architecture on macOS"
    end
  elsif OS.linux?
    case Hardware::CPU.arch
    when :arm64
      url "https://github.com/kubestellar/kubestellar/releases/download/v0.11.0/kubestellaruser_v0.11.0_linux_arm64.tar.gz"
      sha256 "886254adc1064f3519974c2771f579313b0e96c83569a370aefb3d924271fd79"
    when :x86_64
      url "https://github.com/kubestellar/kubestellar/releases/download/v0.11.0/kubestellaruser_v0.11.0_linux_amd64.tar.gz"
      sha256 "b2016263f74319077e19ca6825068062a395a4c32e04248e6a4b6235164d1214"
    when :s390x
      url "https://github.com/kubestellar/kubestellar/releases/download/v0.11.0/kubestellaruser_v0.11.0_linux_s390x.tar.gz"
      sha256 "4e5139489f28c6e95543209039b02019ebee8b7e9a5458a88e19cfbbeb2de5eb"
    when :ppc64
      url "https://github.com/kubestellar/kubestellar/releases/download/v0.11.0/kubestellaruser_v0.11.0_linux_ppc64le.tar.gz"
      sha256 "f215c2b47436adf4eddd67aaeaa73df4c97c61be011d9132318488674fc4b382"
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
