//
// Attributed.swift
//
// Copyright (c) 2016-2017 Nicholas Maccharoli
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import Foundation
import UIKit

/**
 Features that exist in Attributed are written as extensions to this class `Attributed`.
 */

public final class Attributed<Base> {
    let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}

/**
 Types that have Attributed extensions extend `AttributedCompatible`.
 */

public protocol AttributedCompatible {
    associatedtype CompatibleType

    var at: CompatibleType { get }
}

public extension AttributedCompatible {
    public var at: Attributed<Self> {
        return Attributed(self)
    }
}

/**
 Types that wish to implement Attributed extensions should adapt `AttributedCompatible` first 
 and then write extensions in the format of: 
    
    `extension Attributed where Base == SomeType { ... }`
 
 The merit of adapting the `AttributedCompatible` protocol
 is that methods defined in this mannor are grouped under their own `at` namespace, therefore the chance 
 of naming collisions is lower and when reading through code that uses the attributed library it is clear 
 what is an extension that Attributed provides and what is not.
 */

extension String: AttributedCompatible { }
extension NSString: AttributedCompatible { }
extension NSAttributedString: AttributedCompatible { }
