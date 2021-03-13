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

public struct Size: Equatable {

  public static let zero = Size()

  public var width: Int = 0
  public var height: Int = 0

  public init() {}

  public init(width: Int, height: Int) {
    self.width = width
    self.height = height
  }

  public static func == (lhs: Size, rhs: Size) -> Bool {
    return lhs.width == rhs.width
      && lhs.height == rhs.height
  }

  public static func != (lhs: Size, rhs: Size) -> Bool {
    return !(lhs == rhs)
  }
}

public struct Resolution: Equatable {

  public static let zero = Resolution()

  public var width: Double = 0
  public var height: Double = 0

  public init() {}

  public init(width: Double, height: Double) {
    self.width = width
    self.height = height
  }

  public static func == (lhs: Resolution, rhs: Resolution) -> Bool {
    return lhs.width == rhs.width
      && lhs.height == rhs.height
  }

  public static func != (lhs: Resolution, rhs: Resolution) -> Bool {
    return !(lhs == rhs)
  }
}
// }
