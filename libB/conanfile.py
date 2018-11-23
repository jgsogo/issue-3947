from conans import ConanFile, CMake, tools


class LibaConan(ConanFile):
    name = "libB"

    requires = "libA/1.latest@demo/test"

