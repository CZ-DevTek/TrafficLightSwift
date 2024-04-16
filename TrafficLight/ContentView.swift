//
//  ContentView.swift
//  TrafficLight
//
//  Created by Carlos Garcia Perez on 16/4/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                Circle()
                    .frame(width: 130, height: 130)
                    .foregroundStyle(.red)
                    .overlay(Circle().stroke(Color.white, lineWidth: 6))
                    .opacity(0.5)
                Circle()
                    .frame(width: 130, height: 130)
                    .foregroundStyle(.orange)
                    .overlay(Circle().stroke(Color.white, lineWidth: 6))
                    .opacity(0.5)
                Circle()
                    .frame(width: 130, height: 130)
                    .foregroundStyle(.green)
                    .overlay(Circle().stroke(Color.white, lineWidth: 6))
                    .opacity(0.5)
                Spacer()
                Button(action: {}) {
                    Text("START")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(width: 160, height: 55)
                        .background(.blue)
                        .overlay(                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white, lineWidth: 6)
                                )
                }
                .padding(.bottom, 20)
            }
            .padding(.top, 20)
            Spacer()
        }
    }
}
#Preview {
    ContentView()
}
