//
// AttributesTests.swift
//
// Copyright (c) 2016-2018 Nicholas Maccharoli
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
    
    func testBaselineOffset() {
        let expected: [String: Any] = [NSAttributedStringKey.baselineOffset.rawValue: NSNumber(value: 1)]
        let attributed = Attributes().baselineOffset(1)
        XCTAssert(attributed.dictionary.keys.first!.rawValue == expected.keys.first!, "NSBaselineOffsetAttributeName functionality is broken")
    }
    
    
    func testKerning() {
        let testText = "Smoke Test"
        let smokeTestString = testText.at.attributed { $0.kerning(1.0) }
        let baseString = NSAttributedString(string: testText, attributes: [.kern: 1.0])
        
        XCTAssert(smokeTestString == baseString, "Kern functionality is broken")
    }
    
    func testStrokeColor() {
        let testText = "Smoke Test"
        let smokeTestString = testText.at.attributed { $0.strokeColor(.green) }
        let baseString = NSAttributedString(string: testText, attributes: [ .strokeColor : UIColor.green])
        
        XCTAssert(smokeTestString == baseString, "StrokeColor functionality is broken")
    }
    
    func testStrokeWidth() {
        let testText = "Smoke Test"
        let smokeTestString = testText.at.attributed { $0.strokeWidth(2.0) }
        let baseString = NSAttributedString(string: testText, attributes: [ .strokeWidth : 2.0])
        
        XCTAssert(smokeTestString == baseString, "Stroke width functionality is broken")
    }
    
    func testUnderlineStyle() {
        let testText = "Smoke Test"
        let smokeTestString = testText.at.attributed { $0.underlineStyle(NSUnderlineStyle.byWord) }
        let baseString = NSAttributedString(string: testText, attributes: [ .underlineStyle : NSUnderlineStyle.byWord.rawValue])
        
        XCTAssert(smokeTestString == baseString, "Underline style functionality is broken")
    }
    
    func testForegroundColor() {
        let testText = "Smoke Test"
        let smokeTestString = testText.at.attributed { $0.foreground(color: .green) }
        let baseString = NSAttributedString(string: testText, attributes: [ .foregroundColor : UIColor.green])
        
        XCTAssert(smokeTestString == baseString, "Foreground color functionality is broken")
    }
    
    func testBackgroundColor() {
        let testText = "Smoke Test"
        let smokeTestString = testText.at.attributed { $0.background(color: .green) }
        let baseString = NSAttributedString(string: testText, attributes: [ .backgroundColor : UIColor.green])
        
        XCTAssert(smokeTestString == baseString, "Background color functionality is broken")
    }
    
    func testObliqueness() {
        let testText = "Smoke Test"
        let smokeTestString = testText.at.attributed { $0.obliqueness(1.0) }
        let baseString = NSAttributedString(string: testText, attributes: [ .obliqueness : 1.0])
        
        XCTAssert(smokeTestString == baseString, "Obliqueness functionality is broken")
    }
    
    func testShadow() {
        let testText = "Smoke Test"
        let shadow = NSShadow()
        shadow.shadowBlurRadius = 0.5
        let smokeTestString = testText.at.attributed { $0.shadow(shadow) }
        let baseString = NSAttributedString(string: testText, attributes: [ .shadow : shadow])
        
        XCTAssert(smokeTestString == baseString, "Shadow functionality is broken")
    }
}
