//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Pavel Pacák on 13.02.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var lastMessageNumber = -1
    @State private var imageName = ""
    @State private var lastImageNumber = -1
    var body: some View {
        
        VStack {
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .frame(height: 100)
                .minimumScaleFactor(0.5)
                .animation(.easeInOut(duration: 0.15), value: message)
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageName)
            
            Spacer()
            
            Button("Show Message") {
                let messages = ["You Are Awesome!",
                                "You Are Great!",
                                "Fabulous? That's You!",
                                "You Are Fantastic!",
                                "You Swifty!",
                                "You Are a Code Monster!"]
                
                
                var messageNumber = Int.random(in: 0..<messages.count)
                while messageNumber == lastMessageNumber {
                    messageNumber = Int.random(in: 0..<messages.count)
                }
                message = messages[messageNumber]
                lastMessageNumber = messageNumber
                
                                
                var imageNumber = Int.random(in: 0...9)
                while imageNumber == lastImageNumber {
                    imageNumber = Int.random(in: 0...9)
                }
                imageName = "image\(imageNumber)"
                lastImageNumber = imageNumber
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
