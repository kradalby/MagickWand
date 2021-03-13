// ImageWand.swift
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
import Foundation

public class ImageWand: Wand {

  internal var pointer: OpaquePointer

  public var isMagickWand: Bool {
    return IsMagickWand(self.pointer).bool
  }

  public var imageBytes: [UInt8] {
    var size: Int = 0
    guard let imageBlob = MagickGetImageBlob(self.pointer, &size) else {
      return []
    }

    defer {
      MagickRelinquishMemory(imageBlob)
    }

    var result = [UInt8](repeating: 0, count: size)
    for i in 0..<size {
      result[i] = imageBlob[i]
    }

    return result
  }

  public var data: Data? {
    let array = self.imageBytes

    guard array.count > 0 else { return nil }

    return Data(array)
  }

  deinit {
    self.clear()
    self.destroy()
  }

  public required init?() {
    guard let pointer = NewMagickWand() else { return nil }
    self.pointer = pointer
  }

  public required init(pointer: OpaquePointer) {
    self.pointer = pointer
  }

  public convenience init?(color: String, size: MagickWand.Size, format: String = "png") {
    self.init()

    guard let pixelWand = PixelWand(color: color) else {
      self.destroy()
      return nil
    }

    MagickNewImage(self.pointer, size.width, size.height, pixelWand.pointer)
    self.format = format
  }

  public convenience init?(filePath: String) {
    self.init()
    MagickReadImage(self.pointer, filePath)
  }

  public func clear() {
    guard self.isMagickWand else { return }
    ClearMagickWand(self.pointer)
  }

  public func clone() -> Self? {
    guard let pointer = CloneMagickWand(self.pointer) else { return nil }
    return type(of: self).init(pointer: pointer)
  }

  public func destroy() {
    guard MagickWand.isInstantiated else { return }
    guard self.isMagickWand else { return }
    DestroyMagickWand(self.pointer)
  }
}
