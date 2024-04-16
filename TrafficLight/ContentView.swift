//
//  ContentView.swift
//  TrafficLight
//
//  Created by Carlos Garcia Perez on 16/4/24.
//

import SwiftUI

struct ContentView: View {
    @State private var redOpacity = 0.3
    @State private var yellowOpacity = 0.3
    @State private var greenOpacity = 0.3
    @State private var currentLight = CurrentLight.red
    @State private var lightIsOn = 1.0
    @State private var lightIsOff = 0.3
    @State private var isFirstTap = true
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                Circle()
                    .frame(width: 130, height: 130)
                    .foregroundStyle(.red)
                    .overlay(Circle().stroke(Color.white, lineWidth: 6))
                    .opacity(redOpacity)
                Circle()
                    .frame(width: 130, height: 130)
                    .foregroundStyle(.orange)
                    .overlay(Circle().stroke(Color.white, lineWidth: 6))
                    .opacity(yellowOpacity)
                Circle()
                    .frame(width: 130, height: 130)
                    .foregroundStyle(.green)
                    .overlay(Circle().stroke(Color.white, lineWidth: 6))
                    .opacity(greenOpacity)
                Spacer()
                Button(action: {
                    changeLight()
                }) {
                    Text(isFirstTap ? "START" : "NEXT")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(width: 160, height: 55)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white, lineWidth: 6)
                        )
                }
                .padding(.bottom, 20)
            }
            .padding(.top, 20)
        }
    }
    
    private func changeLight() {
        if isFirstTap {
            isFirstTap = false
        }
        
        switch currentLight {
            case .red:
                redOpacity = lightIsOn
                greenOpacity = lightIsOff
                currentLight = .yellow
            case .yellow:
                redOpacity = lightIsOff
                yellowOpacity = lightIsOn
                currentLight = .green
            case .green:
                yellowOpacity = lightIsOff
                greenOpacity = lightIsOn
                currentLight = .red
        }
    }
}

enum CurrentLight {
    case red, yellow, green
}
#Preview {
    ContentView()
}
