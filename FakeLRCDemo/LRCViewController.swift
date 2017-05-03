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
        _textfield.alignment = .center
        self.view.addSubview(_textfield)
        
        
        _textfield.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        textfield = _textfield //不想写 if let 😂
        self.updateFontSize()

        let shortcut = MASShortcut(
            keyCode: UInt(CONST.LRC_HOT_KEY),
            modifierFlags: NSEventModifierFlags.command.rawValue
        )
        
        MASShortcutMonitor.shared().register(shortcut) {
            self.showNextLine()
        }
    }
    
    func updateFontSize() {
        
        if let textfield = textfield {
            var fontSize = CONST.LRCVIEW.TEXTFIELD_FONT_SIZE;
            let str = textfield.stringValue as NSString
            
            var width = NSApplication.shared().windows.first?.screen?.frame.size.width ?? 0
            width = width - CONST.WINDOW.LEFT_OFFSET - CONST.WINDOW.RIGHT_OFFSET

            while true {
                let size = str.size(withAttributes: [NSFontAttributeName: NSFont.systemFont(ofSize: fontSize)])
                
                if size.width <= width {
                    break
                } else {
                    fontSize -= 1
                }
                
            }
            
            textfield.font = NSFont.systemFont(ofSize: fontSize)
        }
    }
    
    func showNextLine() {
        arrCurrentPos += 1
        
        if let textfield = textfield {
        if arrCurrentPos < (lrcArr?.count ?? 0) {
            textfield.stringValue = lrcArr?[arrCurrentPos] ?? ""
            self.updateFontSize()
        } else {
            //HIDE
        }
        }
    }
}

