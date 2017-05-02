//
//  AppDelegate.swift
//  KeynoteTest
//
//  Created by txx on 02/05/2017.
//  Copyright © 2017 txx. All rights reserved.
//

import Cocoa
import MASShortcut

class AppDelegate: NSObject, NSApplicationDelegate {

    
    var window: NSWindow?
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        window = LRCWindow()
        window?.makeKeyAndOrderFront(nil)
        
//        let shortcut = MASShortcut(keyCode: UInt(kVK_F1), modifierFlags: NSEventModifierFlags.command.rawValue)
//        
//        var a = 0
//        MASShortcutMonitor.shared().register(shortcut) {
//            a += 1
//            print("hello" + String(a))
//        }
    }

    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

