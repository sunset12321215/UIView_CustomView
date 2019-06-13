//
//  StringExtension.swift
//  UIView_CustomView
//
//  Created by HoaLT-D1 on 6/13/19.
//  Copyright © 2019 HoaLT-D1. All rights reserved.
//

import UIKit

extension String {
    subscript (i: Int) -> String {
        let char = self[index(startIndex, offsetBy: i)]
        return String(char)
    }
}
