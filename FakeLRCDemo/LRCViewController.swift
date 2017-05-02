//
//  LRCViewController.swift
//  KeynoteTest
//
//  Created by txx on 02/05/2017.
//  Copyright © 2017 txx. All rights reserved.
//

import Cocoa
import MASShortcut

class LRCViewController: NSViewController {

    var lrcArr: [String]?
    var arrCurrentPos = 0
    var textfield: NSTextField?
    
    override func loadView() {
        let view = NSView(frame: NSZeroRect)
        self.view = view
    }

    func parseLRC() {
        if let path = Bundle.main.path(forResource: CONST.LRC_FILE_NAME, ofType: CONST.LRC_FILE_EXT) {
            if let lrc = try? String(contentsOfFile: path) {
                lrcArr = lrc.components(separatedBy: "\n")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parseLRC()
        
        let _textfield = NSTextField()

        _textfield.stringValue = (labelWithString: lrcArr?[0] ?? "Hello World")
        _textfield.drawsBackground = false
        _textfield.isEditable = false
        _textfield.isBezeled = false;
        _textfield.backgroundColor = CONST.LRCVIEW.TEXTFILED_BACKGROUND_COLOR
        
        _textfield.textColor = CONST.LRCVIEW.TEXTFILED_COLOR
        _textfield.font = NSFont.systemFont(ofSize: CONST.LRCVIEW.TEXTFIELD_FONT_SIZE)
        _textfield.alignment = .center
        self.view.addSubview(_textfield)
        
        
        _textfield.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        textfield = _textfield //不想写 if let 😂
        
        let shortcut = MASShortcut(
            keyCode: UInt(CONST.LRC_HOT_KEY),
            modifierFlags: NSEventModifierFlags.command.rawValue
        )
        
        MASShortcutMonitor.shared().register(shortcut) {
            self.showNextLine()
        }
    }
    
    func showNextLine() {
        arrCurrentPos += 1
        
        if arrCurrentPos < (lrcArr?.count ?? 0) {
            textfield?.stringValue = lrcArr?[arrCurrentPos] ?? ""
        } else {
            //HIDE
        }
    }
}

