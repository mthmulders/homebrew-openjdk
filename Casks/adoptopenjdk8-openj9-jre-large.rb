# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask "adoptopenjdk8-openj9-jre-large" do
  version "8,265:b01"
  sha256 "33fe9ef7db8c7951bc8ddd07442b362c06e88d3f9bf6bc7b02901da89c93d63e"

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url "https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u265-b01_openj9-0.21.0/OpenJDK8U-jre_x64_mac_openj9_macosXL_8u265b01_openj9-0.21.0.pkg"
  appcast "https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases/latest"
  name "AdoptOpenJDK 8 (OpenJ9) (JRE) (XL)"
  homepage "https://adoptopenjdk.net/"

  pkg "OpenJDK8U-jre_x64_mac_openj9_macosXL_8u265b01_openj9-0.21.0.pkg"

  postflight do
    system_command "/usr/sbin/pkgutil", args: ["--pkg-info", "net.adoptopenjdk.8-openj9.jre"], print_stdout: true
  end

  uninstall pkgutil: "net.adoptopenjdk.8-openj9.jre"
end
