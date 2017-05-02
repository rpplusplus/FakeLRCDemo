//
//  AppDelegate.swift
//  KeynoteTest
//
//  Created by txx on 02/05/2017.
//  Copyright © 2017 txx. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {

    
    var window: NSWindow?
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        window = LRCWindow()
        window?.makeKeyAndOrderFront(nil)
    }

    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

