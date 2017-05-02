//
//  LRCWindow.swift
//  KeynoteTest
//
//  Created by txx on 02/05/2017.
//  Copyright © 2017 txx. All rights reserved.
//

import Cocoa

class LRCWindow: NSWindow {
    
    let controller: NSViewController
    
    init() {
        
        controller = LRCViewController()
        
        super.init(
            contentRect: NSMakeRect(10, 10, 300, 300),
            styleMask: .borderless,
            backing: .buffered,
            defer: false)
        
        self.backgroundColor = NSColor.green
        self.isOpaque = false
        self.level = Int(CGWindowLevelForKey(.mainMenuWindow))
        self.collectionBehavior = [.canJoinAllSpaces, .fullScreenAuxiliary]
        
        self.contentView?.addSubview(controller.view)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateWindowPosition),
                                               name: Notification.Name.NSApplicationDidChangeScreenParameters,
                                               object: nil)
        updateWindowPosition()
    }
    
    func updateWindowPosition() {
        if let screen = screen {
            let size = screen.frame.size
            
            let offset: CGFloat = 30.0
            let height: CGFloat = 100.0
            
            let rect = CGRect(x: offset, y: offset, width: size.width - 2*offset, height: height)
            
            self.setFrame(rect, display: true, animate: false)
            
        }
    }
}

