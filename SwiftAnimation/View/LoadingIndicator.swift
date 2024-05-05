//
//  LoadingIndicator.swift
//  SwiftAnimation
//
//  Created by Dicky Fahriza on 22/04/24.
//

import SwiftUI

struct LoadingIndicator: View {
    @State private var isLoading = false
    @State private var progress: CGFloat = 0.0
    
    var body: some View {
        VStack(spacing: 30) {
            LoadingProgress()
            LoadingWithProgress()
        }
    }
}

#Preview {
    LoadingIndicator()
}

struct LoadingProgress: View {
    @State private var isLoading = false
    @State private var progress: CGFloat = 0.0
    
    var body: some View {
        Circle()
            .trim(from: 0.0, to: 0.7)
            .stroke(Color.green, lineWidth: 10)
            .frame(width: 100, height: 100)
            .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
            .animation(.linear(duration: 0.5).repeatForever(autoreverses: false), value: isLoading)
            .onAppear {
                isLoading = true
                Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
//                    Progress = progress + 0.5
//                    progress += 0.05
                    
                    if progress > 1.0 {
//                        timer.invalidate()
                        progress = 0.0
                        
                    } else {
                        progress += 0.5
                    }
                }
            }
    }
}

struct LoadingWithProgress: View {
    @State private var isLoading = false
    @State private var progress: CGFloat = 0.0
    var body: some View {
        ZStack {
            Text("\(progress * 100, specifier: "%.f")%")
            Circle()
                .stroke(Color(.systemGray5), lineWidth: 12)
            
            Circle()
                .trim(from: 0.0, to: 0.7)
                .stroke(Color.black, lineWidth: 10)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(.linear(duration: 0.5).repeatForever(autoreverses: false), value: isLoading)
            
                .onAppear {
                    isLoading = true
                    Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                        progress += 0.01
                        
                        if progress > 1.0 {
                            // timer.invalidate()
                            progress = 0.0
                        } else {
                            progress += 0.01
                        }
                    }
                }
            
        }
        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
    }
}
