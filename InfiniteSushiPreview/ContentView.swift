//
//  ContentView.swift
//  InfiniteSushiPreview
//
//  Created by プチいちご on 2021/03/13.
//  Copyright © 2021 PetitStrawberry. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SushiView()
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
