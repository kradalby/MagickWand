# Disclaimer

This project is forked from [naithar/MagickWand](https://github.com/naithar/MagickWand), I have fixed things that I needed for my project ([munin](https://github.com/kradalby/munin)) and upgraded it to newer Swift.

Project is currently under development.
Some feature may not work as expected or may not work at all.
Use at your own risk.

PRs and bugreports are more than welcome.

# Swift MagickWand

[![Swift](https://img.shields.io/badge/swift-5.0-orange.svg?style=flat)](https://swift.org)
[![imagemagick](https://img.shields.io/badge/ImageMagick-6.9.x-orange.svg?style=flat)](https://www.imagemagick.org/script/index.php)
[![MIT](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](/LICENSE)
[![Build Status](https://travis-ci.org/naithar/MagickWand.svg?branch=master)](https://travis-ci.org/naithar/MagickWand)
[![codebeat badge](https://codebeat.co/badges/fad61ebd-809c-4a22-995d-5633e314f119)](https://codebeat.co/projects/github-com-naithar-magickwand)
[![Code Climate](https://codeclimate.com/github/naithar/MagickWand/badges/gpa.svg)](https://codeclimate.com/github/naithar/MagickWand)
[![codecov](https://codecov.io/gh/naithar/MagickWand/branch/master/graph/badge.svg)](https://codecov.io/gh/naithar/MagickWand)
![platforms](https://img.shields.io/badge/platform-macOS%20Linux-green.svg?style=flat)
![SPM](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange.svg?style=flat)

This package supports 6.9.x version of ImageMagick.


## Intallation

### Mac OSX

```
brew install imagemagick@6
```

### Linux

```
apt-get install libmagickwand-6.q16-dev
```

### Add Package

Add this package to `dependencies` in your `Package.swift` file.

```
.Package(url: "https://github.com/naithar/MagickWand.git", from: "0.4.0")
```

## Building, Testing and XCode Setup

If `pgk-config` is installed no extra flags are required.
