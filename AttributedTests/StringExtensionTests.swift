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
    func testAttributed() {
        let attributes = Attributes {
            return $0.font(UIFont(name: "Chalkduster", size: 18.0)!)
                     .foreground(color: .green)
        }
        let attributedString = "This is a test".attributed(with: attributes)
        
        
    }
    
}
