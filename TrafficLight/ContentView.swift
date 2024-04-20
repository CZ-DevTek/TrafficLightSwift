//
//  ContentView.swift
//  TrafficLight
//
//  Created by Carlos Garcia Perez on 16/4/24.
//

import SwiftUI

enum CurrentLight {
    case red, yellow, green
}

struct ContentView: View {
    @State private var buttonTitle = "START"
    
    @State private var redOpacity = 0.3
    @State private var yellowOpacity = 0.3
    @State private var greenOpacity = 0.3
    @State private var currentLight = CurrentLight.red

    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack (spacing: 20) {
                ColorCircleView(color: .red, opacity: redOpacity)
                ColorCircleView(color: .yellow, opacity: yellowOpacity)
                ColorCircleView(color: .green, opacity: greenOpacity)
                Spacer()
                
                StartButtonView(title: buttonTitle) {
                    if buttonTitle == "START" {
                        buttonTitle = "NEXT"
                    }
                    changeLight()
                }
                .padding()
            }
        }
    }
    private func changeLight() {
        let lightIsOn = 1.0
        let lightIsOff = 0.3
        
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

#Preview {
    ContentView()
}
