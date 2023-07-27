//
//  Color.swift
//  TestingSpriteKit
//
//  Created by thaxz on 27/07/23.
//

import Foundation
import SwiftUI

extension UIColor {
    
    static let theme = ColorTheme()
    
}

struct ColorTheme {
    
    let background = UIColor(named: "backgroundColor")!
    let floor = UIColor(named: "floorColor")!
    
}
