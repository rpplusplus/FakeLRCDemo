//
//  LRCWindow.swift
//  KeynoteTest
//
//  Created by txx on 02/05/2017.
//  Copyright © 2017 txx. All rights reserved.
//

import Cocoa
import SnapKit

class LRCWindow: NSWindow {
    
    let controller: NSViewController
    
    init() {
        
        controller = LRCViewController()
        
        super.init(
            contentRect: NSMakeRect(0, 0, 100, 100),    //这个地方不能用 NSZeroRect 会不生成 window
            styleMask: .borderless,
            backing: .buffered,
            defer: false)
        
        self.backgroundColor = CONST.WINDOW.BACKGROUND_COLOR
        self.isOpaque = false
        self.level = Int(CGWindowLevelForKey(.mainMenuWindow))
        self.collectionBehavior = [.canJoinAllSpaces, .fullScreenAuxiliary]
        
        self.contentView?.addSubview(controller.view)
        
        setupMenu()
        
        controller.view.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateWindowPosition),
                                               name: Notification.Name.NSApplicationDidChangeScreenParameters,
                                               object: nil)
        updateWindowPosition()
    }
    
    func setupMenu() {
        let menu = NSMenu()
        let appMenuItem = NSMenuItem()
        menu.addItem(appMenuItem)
        
        NSApp.mainMenu = menu
        
        let appMenu = NSMenu()
        let quitMenuItem = NSMenuItem(title: "Quit", action: #selector(terminate), keyEquivalent: "q")
        quitMenuItem.keyEquivalentModifierMask = .command
        quitMenuItem.isEnabled = true
        quitMenuItem.target = self
        
        appMenu.addItem(quitMenuItem)
        appMenuItem.submenu = appMenu
    }
    
    func terminate () {
        NSApplication.shared().terminate(nil)
    }
    
    func updateWindowPosition() {
        if let screen = screen {
            let size = screen.frame.size
            
            let rect = CGRect(
                x: CONST.WINDOW.LEFT_OFFSET,
                y: CONST.WINDOW.BOTTOM_OFFSET,
                width: size.width - CONST.WINDOW.LEFT_OFFSET - CONST.WINDOW.RIGHT_OFFSET,
                height: CONST.WINDOW.HEIGHT)
            
            self.setFrame(rect, display: true, animate: false)
        }
    }
}

