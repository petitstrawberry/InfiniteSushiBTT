//
//  SushiView.swift
//  BTTPluginInfiniteSushi
//
//  Created by プチいちご on 2021/03/07.
//

import SwiftUI

struct SushiView: View {
    @State var sushi: Int = 20
    @State var offset: CGFloat = 0
    let timer = Timer.publish(every: 1.0, on: .current, in: .common).autoconnect()

    
    var body: some View {
        
        GeometryReader { geometry in
            HStack (alignment: .firstTextBaseline, spacing: 30) {
                ForEach(1..<21) { num in
                    VStack {
                        //Text(num.description)
                        Text("🍣").font(Font.custom("Sushi", fixedSize: 20))
                    }
                    .frame(width: 40)
                }
            }
            .onReceive(timer,
                    perform: { _ in
                        if offset != 0 && offset.truncatingRemainder(dividingBy: 70) == 0 {
                            offset = 0
                        }
                        withAnimation(.linear(duration: 1.0)){
                            offset+=70
                        }
                        
                    }
            )
            .offset(x: -offset)
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .leading)
            .clipped()
        }
        
        
    }
}

struct SushiView_Previews: PreviewProvider {
    static var previews: some View {
        SushiView()
    }
}
