//
// AttributesTests.swift
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

import XCTest
@testable import Attributed

class AttributesTests: XCTestCase {
    func testFont() {
        let expected: [String: Any] = [NSAttributedStringKey.font.rawValue: UIFont.systemFont(ofSize: 12.0)]
        let attributed = Attributes().font(.systemFont(ofSize: 12.0))
        XCTAssert(attributed.dictionary.keys.first!.rawValue == expected.keys.first!, "Font is broken")
    }

    // NSBaselineOffsetAttributeName

    func testBaselineOffset() {
        let expected: [String: Any] = [NSBaselineOffsetAttributeName: NSNumber(value: 1)]
        let attributed = Attributes().baselineOffset(1)
        XCTAssert(attributed.dictionary.keys.first! == expected.keys.first!, "NSBaselineOffsetAttributeName functionality is broken")
    }
}
