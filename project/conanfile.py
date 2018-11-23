from conans import ConanFile, CMake, tools


class LibaConan(ConanFile):

    requires = "libB/1.latest@demo/test"


