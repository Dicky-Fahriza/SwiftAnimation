//
//  TransitionView.swift
//  SwiftAnimation
//
//  Created by MacBook Pro on 22/04/24.
//

import SwiftUI

struct TransitionView: View {
    @State private var show = false
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 300, height: 300)
                .foregroundStyle(.green)
                .overlay {
                    Text("Show details")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    
                }
                
            
            if show {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 300, height: 300)
                    .foregroundStyle(.blue)
//                    .transition(.scale(scale: 0, anchor: .bottom))
                    .transition(.offsetScaleOpacity)
                    .overlay {
                        Text("Well, it goes like this!")
                            .font(.system(.largeTitle, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        
                }
            } else {
                EmptyView()
            }
            
            
        }
        .onTapGesture {
            withAnimation(.interactiveSpring) {
                show.toggle()
            }
        }
    }
}

#Preview {
    TransitionView()
}

// MARK: - EXTENSION
extension AnyTransition {
    static var offsetScaleOpacity: AnyTransition {
//        AnyTransition.offset(x: -600, y: 0).combined(with: .scale).combined(with: .opacity)
        AnyTransition.asymmetric(insertion: .scale, removal: .offset(x: -600, y: 0))
    }
}
