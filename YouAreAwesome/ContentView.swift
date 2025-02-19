//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Pavel Pacák on 13.02.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageString = ""
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Image(systemName: imageString)
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.ultraLight)
            
            Spacer()
            
            Button("Press Me!") {
                let message1 = "You Are Awesome!"
                let message2 = "You Are Great!"
                
                let imageString1 = "sun.max.fill"
                let imageString2 = "hand.thumbsup"
                
                
                if message == message1 {
                    message = message2
                    imageString = imageString2
                } else {
                    message = message1
                    imageString = imageString1
                }
            }
            .buttonStyle(.borderedProminent)
            .tint(.orange)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
