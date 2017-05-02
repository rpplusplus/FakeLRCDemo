//
//  LRCViewController.swift
//  KeynoteTest
//
//  Created by txx on 02/05/2017.
//  Copyright © 2017 txx. All rights reserved.
//

import Cocoa

class LRCViewController: NSViewController {

    override func loadView() {
        let view = NSView(frame: NSMakeRect(0,0,100,100))
        view.wantsLayer = true
        view.layer?.borderWidth = 2
        view.layer?.borderColor = NSColor.red.cgColor
        
        self.view = view
    }

}

