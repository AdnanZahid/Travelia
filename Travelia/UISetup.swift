//
//  UISetup.swift
//  Travelia
//
//  Created by Adnan Zahid on 1/16/17.
//  Copyright © 2017 Adnan Zahid. All rights reserved.
//

import UIKit

class UISetup {
    
    static func setCustomUI() {
        
        UISetup.setCustomFonts()
        UISetup.setCustomFontColors()
    }

    private static func setCustomFonts() {
        
        UITextField.appearance().font = btRomanFont
        UIButton.appearance().titleLabel?.font = btRomanFont
    }
    
    private static func setCustomFontColors() {
        
    }
}
