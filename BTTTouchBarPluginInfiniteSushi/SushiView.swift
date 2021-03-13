//
//  SushiView.swift
//  BTTPluginInfiniteSushi
//
//  Created by プチいちご on 2021/03/07.
//  Copyright © 2021 PetitStrawberry. All rights reserved.
//

import SwiftUI

struct SushiView: View {
    @State var sushi: Int = 20
    @State var offset: CGFloat = 0
    let timer = Timer.publish(every: 1.0, on: .current, in: .common).autoconnect()
    let rainbowColor = stride(from: 0, to: 1, by: 0.1).map {
        Color(hue: $0, saturation: 1, brightness: 1)
    }
    
    
    @State var sushiViews: [AnyView] = randomViews()
    var body: some View {
        
        GeometryReader { geometry in
            HStack (alignment: .firstTextBaseline, spacing: 30) {
                ForEach(1..<21) { num in
                   sushiViews[num]
                    .frame(width: 40)
                }
                
            }
            .onReceive(timer,
                    perform: { _ in
                        if offset != 0 && offset.truncatingRemainder(dividingBy: 70) == 0 {
                            offset = 0
                            sushiViews.removeFirst()
                            sushiViews.append(AnyView(SushiView.getSushiView()))
                        }
                        withAnimation(.linear(duration: 1.0)){
                            offset+=70
                        }
                        
                    }
            )
            
            .offset(x: -offset)
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .leading)
            .background(Color(.controlColor))
            .clipped()
        }
    }
    
    static func getBundle() -> Bundle {
        class DummyClass{}
        
        return Bundle(for: type(of: DummyClass()))
        
    }
    
    static func randomViews() -> [AnyView] {
        var array = [AnyView]()
        
        for _ in 0...20 {
            array.append(AnyView(getSushiView()))
        }
        
        return array
    }
    
    static func getSushiView() -> some View {
        let n = Int.random(in: 1...4)
        let bundle = getBundle()
        
        switch n {
        
        case 1:
            return Image("ikura", bundle: bundle)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
            
        case 2:
            return Image("negitoro", bundle: bundle)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
            
        case 3:
            return Image("kazunoko", bundle: bundle)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
        //return Text("🍺").font(Font.custom("Sushi", size: 20))
            
        default:
            return Image("akami", bundle: bundle)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
            
                
                
        }
    }
}

struct SushiView_Previews: PreviewProvider {
    static var previews: some View {
        SushiView()
    }
}
