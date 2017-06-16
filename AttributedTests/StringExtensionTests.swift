//
// StringExtensionTests.swift
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


final class StringExtensionTests: XCTestCase {

    func testAttributedWithAttributes() {
        let string = "😎 Lorem 😀 ipsum 👀 dolor 👻 sit 🎲 amet, 🎲 consectetur 🔥 adipiscing 🚀 elit."
        let attributes = Attributes {
            $0.font(.systemFont(ofSize: 12.0))
                .foreground(color: .darkGray)
        }
        let expected = NSAttributedString(string: string, attributes: attributes.dictionary)
        let attributed = string.at.attributed(with: attributes)
        XCTAssertEqual(expected, attributed)

        let attributed2 = string.at.attributed(with: attributes.foreground(color: .red))
        XCTAssertNotEqual(expected, attributed2)
    }

    func testAttributedWithAttributeBlock() {
        let string = "😎 Lorem 😀 ipsum 👀 dolor 👻 sit 🎲 amet, 🎲 consectetur 🔥 adipiscing 🚀 elit."
        let attributesBlock: ((Attributes) -> Attributes) = {
            $0.font(.systemFont(ofSize: 12.0))
                .foreground(color: .darkGray)
        }
        let expected = NSAttributedString(string: string, attributes: attributesBlock(Attributes()).dictionary)
        let attributed = string.at.attributed(attributesBlock)
        XCTAssertEqual(expected, attributed)

        let attributed2 = string.at.attributed { $0.foreground(color: .red) }
        XCTAssertNotEqual(expected, attributed2)
    }

}


final class NSStringExtensionTests: XCTestCase {

    func testAttributedWithAttributes() {
        let string = "😎 Lorem 😀 ipsum 👀 dolor 👻 sit 🎲 amet, 🎲 consectetur 🔥 adipiscing 🚀 elit." as  NSString
        let attributes = Attributes {
            $0.font(.systemFont(ofSize: 12.0))
                .foreground(color: .darkGray)
        }
        let expected = NSAttributedString(string: (string as String), attributes: attributes.dictionary)
        let attributed = string.at.attributed(with: attributes)
        XCTAssertEqual(expected, attributed)

        let attributed2 = string.at.attributed(with: attributes.foreground(color: .red))
        XCTAssertNotEqual(expected, attributed2)
    }

    func testAttributedWithAttributeBlock() {
        let string = "😎 Lorem 😀 ipsum 👀 dolor 👻 sit 🎲 amet, 🎲 consectetur 🔥 adipiscing 🚀 elit." as  NSString
        let attributesBlock: ((Attributes) -> Attributes) = {
            $0.font(.systemFont(ofSize: 12.0))
                .foreground(color: .darkGray)
        }

        let expected = NSAttributedString(string: (string as String), attributes: attributesBlock(Attributes()).dictionary)
        let attributed = string.at.attributed(attributesBlock)
        XCTAssertEqual(expected, attributed)

        let attributed2 = string.at.attributed { $0.foreground(color: .red) }
        XCTAssertNotEqual(expected, attributed2)
    }

}


final class NSAttributedStringExtensionTests: XCTestCase {

    func testModifiedWithAttributesForRange() {
        let string = "😎 Lorem 😀 ipsum 👀 dolor 👻 sit 🎲 amet, 🎲 consectetur 🔥 adipiscing 🚀 elit."
        let range = (string as NSString).range(of: "👻 sit 🎲 amet, 🎲 consectetur")
        let attributes = Attributes {
            $0.font(.systemFont(ofSize: 12.0))
                .foreground(color: .darkGray)
        }
        let rangeAttributes = Attributes().foreground(color: .red)
        let expected = NSMutableAttributedString(string: (string as String), attributes: attributes.dictionary)
        expected.addAttributes(rangeAttributes.dictionary, range: range)
        let attributed = NSAttributedString(string: (string as String), attributes: attributes.dictionary)
        XCTAssertNotEqual(expected.copy() as! NSAttributedString, attributed)

        XCTAssertEqual(expected.copy() as! NSAttributedString, attributed.at.modified(with: rangeAttributes, for: range))

        // Test againts + operator
        let appended = "😎 Lorem 😀 ipsum 👀 dolor ".at.attributed(with: attributes)
            + "👻 sit 🎲 amet, 🎲 consectetur".at.attributed(with: attributes + rangeAttributes)
            + " 🔥 adipiscing 🚀 elit.".at.attributed(with: attributes)
        XCTAssertEqual(appended, attributed.at.modified(with: rangeAttributes, for: range))
    }

}


final class NSMutableAttributedStringExtensionTests: XCTestCase {

    func testAddAttributesToRange() {
        let string = "😎 Lorem 😀 ipsum 👀 dolor 👻 sit 🎲 amet, 🎲 consectetur 🔥 adipiscing 🚀 elit."
        let range = (string as NSString).range(of: "👻 sit 🎲 amet, 🎲 consectetur")
        let attributes = Attributes {
            $0.font(.systemFont(ofSize: 12.0))
                .foreground(color: .darkGray)
        }
        let rangeAttributes = Attributes().foreground(color: .red)
        let expected = NSMutableAttributedString(string: (string as String), attributes: attributes.dictionary)
        let attributed = NSMutableAttributedString(string: (string as String), attributes: attributes.dictionary)

        expected.addAttributes(rangeAttributes.dictionary, range: range)
        XCTAssertNotEqual(expected, attributed)
        attributed.at.add(rangeAttributes, to: range)
        XCTAssertEqual(expected, attributed)
    }

}
