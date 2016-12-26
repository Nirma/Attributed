//
//  AttributesTests.swift
//  Attributed
//
//  Created by Nicholas Maccharoli on 2016/12/14.
//  Copyright © 2016年 Attributed. All rights reserved.
//

import XCTest
@testable import Attributed

class AttributesTests: XCTestCase {
    func testFont() {
        let expected: [String: Any] = [NSFontAttributeName: UIFont.systemFont(ofSize: 12.0)]
        let attributed = Attributes().font(.systemFont(ofSize: 12.0))
        XCTAssert(attributed.dictionary.keys.first! == expected.keys.first!, "Font is broken")
    }
}
