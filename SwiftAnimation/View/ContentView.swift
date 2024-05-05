//
//  ContentView.swift
//  SwiftAnimation
//
//  Created by Dicky Fahriza on 22/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var colorChanged = false
    @State private var sizeChanged = false
    @State private var symbolChanged = false
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 200, height: 200)
                .foregroundStyle(colorChanged ? .pink : .black)
            
            Image(systemName: symbolChanged ? "heart.fill" : "heart.slash")
                .foregroundStyle(.white)
                .font(.system(size: 100))
                .scaleEffect(sizeChanged ? 1.0 : 1.2)
        }
        
        // .animation(.default, value: colorChanged)
        // .animation(.default, value: sizeChanged)
        
        .onTapGesture {
            // Explicit animation
            withAnimation(.spring(.bouncy, blendDuration: 1.0)) {
                colorChanged.toggle()
                sizeChanged.toggle()
                symbolChanged.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
