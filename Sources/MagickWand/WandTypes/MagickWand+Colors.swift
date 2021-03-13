// MagickWand+Orientation.swift
//
// Copyright (c) 2016 Sergey Minakov
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import CMagickCore
import CMagickWand

// extension MagickWand {

public struct RGBA: Equatable {

  static let clear = RGBA(0, 0, 0, 0)

  public var red: Double
  public var green: Double
  public var blue: Double
  public var alpha: Double

  public init(_ red: Double, _ green: Double, _ blue: Double) {
    self.init(red, green, blue, 1)
  }

  public init(_ red: Double, _ green: Double, _ blue: Double, _ alpha: Double) {
    self.red = red
    self.green = green
    self.blue = blue
    self.alpha = alpha
  }

  public static func == (lhs: RGBA, rhs: RGBA) -> Bool {
    let result =
      lhs.red == rhs.red
      && lhs.green == rhs.green
      && lhs.blue == rhs.blue

    #if os(Linux)
      return result
    #else
      return result
        && lhs.alpha == rhs.alpha
    #endif

  }

  public static func != (lhs: RGBA, rhs: RGBA) -> Bool {
    return !(lhs == rhs)
  }
}

public struct HSL: Equatable {

  static let clear = HSL(0, 0, 0)

  public var hue: Double
  public var saturation: Double
  public var lightness: Double

  public init(_ hue: Double, _ saturation: Double, _ lightness: Double) {
    self.hue = hue
    self.saturation = saturation
    self.lightness = lightness
  }

  public static func == (lhs: HSL, rhs: HSL) -> Bool {
    return lhs.hue == rhs.hue
      && lhs.saturation == rhs.saturation
      && lhs.lightness == rhs.lightness
  }

  public static func != (lhs: HSL, rhs: HSL) -> Bool {
    return !(lhs == rhs)
  }
}

public struct CMY: Equatable {

  static let clear = CMY(0, 0, 0)

  public var cyan: Double
  public var magenta: Double
  public var yellow: Double

  public init(_ cyan: Double, _ magenta: Double, _ yellow: Double) {
    self.cyan = cyan
    self.magenta = magenta
    self.yellow = yellow
  }

  public static func == (lhs: CMY, rhs: CMY) -> Bool {
    return lhs.cyan == rhs.cyan
      && lhs.magenta == rhs.magenta
      && lhs.yellow == rhs.yellow
  }

  public static func != (lhs: CMY, rhs: CMY) -> Bool {
    return !(lhs == rhs)
  }
}
// }
