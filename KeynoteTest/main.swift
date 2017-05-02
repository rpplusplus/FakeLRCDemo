//
//  main.swift
//  KeynoteTest
//
//  Created by txx on 02/05/2017.
//  Copyright © 2017 txx. All rights reserved.
//

import Foundation
import Cocoa

let delegate = AppDelegate() //alloc main app's delegate class
NSApplication.shared().delegate = delegate //set as app's delegate

// Old versions:
// NSApplicationMain(C_ARGC, C_ARGV)
let _ = NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv);  //start of run loop
