//
//  PluginViewController.swift
//  BTTPluginInfiniteSushi
//
//  Created by プチいちご on 2021/03/07.
//

import Cocoa
import SwiftUI

class PluginViewController: NSViewController {
    
    
    override func loadView() {
        var sushiView: some View {
            SushiView()
        }
        self.view = NSHostingView(
            rootView: sushiView
        )
        self.view.setFrameSize(NSSize(width: 640, height: 30))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
