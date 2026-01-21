class MbglRender < Formula
  desc "MapLibre Native static map renderer CLI"
  homepage "https://github.com/maplibre/maplibre-native"
  url "https://github.com/maplibre/maplibre-native.git",
      tag: "node-v6.3.0",
      revision: "4862c8193c2fa49cfa57ac4efa0c647a008f4458"
  version "6.3.0"
  license "BSD-3-Clause"

  depends_on "bazelisk" => :build
  depends_on "cmake" => :build
  depends_on "ninja" => :build
  depends_on "pkg-config" => :build
  depends_on :macos

  def install
    # Initialize submodules
    system "git", "submodule", "update", "--init", "--recursive"

    # Build with OpenGL backend using Ninja generator
    # Link against OpenGL/CGL frameworks for headless rendering
    ENV.append "LDFLAGS", "-framework OpenGL -framework CoreGraphics -framework CoreFoundation"

    system "cmake", "-B", "build", "-G", "Ninja",
           "-DCMAKE_BUILD_TYPE=Release",
           "-DMLN_WITH_METAL=OFF",
           "-DMLN_WITH_OPENGL=ON",
           "-DMLN_WITH_GLFW=OFF",
           "-DCMAKE_EXE_LINKER_FLAGS=-framework OpenGL -framework CoreGraphics -framework CoreFoundation",
           *std_cmake_args
    system "cmake", "--build", "build", "--target", "mbgl-render", "-j#{ENV.make_jobs}"
    bin.install "build/bin/mbgl-render"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/mbgl-render --help", 1)
  end
end
