//
//  UI_69App.swift
//  UI-69
//
//  Created by にゃんにゃん丸 on 2020/12/09.
//

import SwiftUI

@main
struct UI_69App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}

extension NSTextField{
    
    open override var focusRingType: NSFocusRingType{
        
        get{.none}
        set{}
    }
}


