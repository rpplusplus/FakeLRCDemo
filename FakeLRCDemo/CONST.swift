//
//  CONST.swift
//  FakeLRCDemo
//
//  Created by txx on 02/05/2017.
//  Copyright © 2017 txx. All rights reserved.
//

import Cocoa
import MASShortcut

struct CONST {
    
    struct WINDOW {
        public static let LEFT_OFFSET = CGFloat(30.0)
        public static let RIGHT_OFFSET = CGFloat(30.0)
        public static let BOTTOM_OFFSET = CGFloat(30.0)
        public static let HEIGHT = CGFloat(100)
        public static let BACKGROUND_COLOR = NSColor.clear
    }
    
    struct LRCVIEW {
        public static let TEXTFIELD_FONT_SIZE = CGFloat(50)
        public static let TEXTFILED_COLOR = NSColor.white
        public static let TEXTFILED_BACKGROUND_COLOR = NSColor.clear
    }
    
    public static let LRC_HOT_KEY = kVK_F1 //Command + F1
    public static let LRC_FILE_NAME = "lrc"
    public static let LRC_FILE_EXT = "txt"
}
