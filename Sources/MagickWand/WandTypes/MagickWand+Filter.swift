// MagickWand+Filter.swift
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

public enum Filter {

  case blackman
  case box
  case catrom
  case gaussian
  case hanning
  case hermite
  case lanczos
  case mitchell
  case sinc
  case triangle
  case kaiser
  case sentinel
  case welsh

  var filter: FilterTypes {
    switch self {
    case .blackman:
      return BlackmanFilter
    case .box:
      return BoxFilter
    case .catrom:
      return CatromFilter
    case .gaussian:
      return GaussianFilter
    case .hanning:
      return HanningFilter
    case .hermite:
      return HermiteFilter
    case .lanczos:
      return LanczosFilter
    case .mitchell:
      return MitchellFilter
    case .sinc:
      return SincFilter
    case .triangle:
      return TriangleFilter
    case .kaiser:
      return KaiserFilter
    case .sentinel:
      return SentinelFilter
    case .welsh:
      return WelshFilter
    }
  }
}
// }
