//
// String+Attributed.swift
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

// MARK: Primary Extension

extension Attributed where Base == String {

    public func attributed(with attributes: Attributes) -> NSAttributedString {
        let attributes = attributes.dictionary
        return NSAttributedString(string: base, attributes: attributes)
    }

    public func attributed(_ attributeBlock: (Attributes) -> (Attributes)) -> NSAttributedString {
        let attributes = attributeBlock(Attributes())
        return attributed(with: attributes)
    }
}

public extension Attributed where Base == NSMutableAttributedString {

    public func add(_ attributes: Attributes, to range: NSRange) {
        base.addAttributes(attributes.dictionary, range: range)
    }

}

public extension Attributed where Base == NSAttributedString {

    public func modified(with attributes: Attributes, for range: NSRange) -> NSAttributedString {
        let string = base as NSAttributedString

        let result = NSMutableAttributedString(attributedString: string)
        result.at.add(attributes, to: range)
        return NSAttributedString(attributedString: result)
    }
}
