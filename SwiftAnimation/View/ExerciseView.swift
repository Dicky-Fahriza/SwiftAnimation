//
//  ExerciseView.swift
//  SwiftAnimation
//
//  Created by Dicky Fahriza on 22/04/24.
//

import SwiftUI

struct ExerciseView: View {
    @State private var isShow = false
    @State private var isLoading = false
    
    var body: some View {
        VStack {
            Image(systemName: "star.fill")
                .font(.system(size: 100))
            
            if isShow {
                HStack {
                    Text("5.0 ⭐️")
                        .font(.title)
                        .padding(.top, -20)
                }
                .padding()
                .transition(.offset(x: 0, y: -60).combined(with: .opacity))
            }
            
            HStack {
                ForEach(0...4, id: \.self) { item in
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundStyle(isLoading ? .gray : .green)
                        
                        .scaleEffect(isLoading ? 0.5 : 1.0)
                        .animation(.linear(duration: 0.6).repeatForever().delay(0.2*Double(item)), value: isLoading)
                }
            }
        }
        .animation(.default, value: isShow)
        .onTapGesture {
            handleClick()
        }
        .onAppear {
            isLoading.toggle()
        }
    }
}
        
        
#Preview {
    ExerciseView()
}
        
extension ExerciseView {
    // delay saat handleClick
    func handleClick() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            isShow.toggle()
        })
    }
}

