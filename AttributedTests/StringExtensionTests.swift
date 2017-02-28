//
//  StringExtensionTests.swift
//  Attributed
//
//  Created by Nicholas Maccharoli on 2016/12/22.
//  Copyright © 2016年 Attributed. All rights reserved.
//

import XCTest
@testable import Attributed

class StringExtensionTests: XCTestCase {
    // TODO: Write Tests
}


final class NSStringExtensionTests: XCTestCase {

    func testAttributedWithAttributes() {
        let string = "😎 Lorem 😀 ipsum 👀 dolor 👻 sit 🎲 amet, 🎲 consectetur 🔥 adipiscing 🚀 elit." as  NSString
        let attributes = Attributes {
            $0.font(.systemFont(ofSize: 12.0))
                .foreground(color: .darkGray)
        }
        let expected = NSAttributedString(string: (string as String), attributes: attributes.dictionary)
        let attributed = string.attributed(with: attributes)
        XCTAssertEqual(expected, attributed)

        let attributed2 = string.attributed(with: attributes.foreground(color: .red))
        XCTAssertNotEqual(expected, attributed2)
    }

    func testAttributedWithAttributeBlock() {
        let string = "😎 Lorem 😀 ipsum 👀 dolor 👻 sit 🎲 amet, 🎲 consectetur 🔥 adipiscing 🚀 elit." as  NSString
        let attributesBlock: ((Attributes) -> Attributes) = {
            $0.font(.systemFont(ofSize: 12.0))
                .foreground(color: .darkGray)
        }
        let expected = NSAttributedString(string: (string as String), attributes: attributesBlock(Attributes()).dictionary)
        let attributed = string.attributed(attributesBlock)
        XCTAssertEqual(expected, attributed)

        let attributed2 = string.attributed { $0.foreground(color: .red) }
        XCTAssertNotEqual(expected, attributed2)
    }

}
