//
//  ContentView.swift
//  YouAreAwesome2
//
//  Created by Pavel Pacák on 13.03.2025.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    
    @State private var message = ""
    @State private var lastMessageNumber = -1
    
    @State private var imageName = ""
    @State private var lastImageNumber = -1
    @State private var numberOfImages = 10
    
    @State private var audioPlayer: AVAudioPlayer!
    @State private var lastSoundNumber = -1
    @State private var numberOfSounds = 6
    
    var body: some View {
        
        VStack {
            
            Text(message)
                .font(.system(size: 40))
                .fontWeight(.semibold)
                .foregroundStyle(.red)
                .animation(.easeInOut(duration: 0.15), value: message)
            
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .animation(.default, value: imageName)
            
            
            Spacer()
            
            Button("Press Me") {
                let messages = ["Wow!", "Nice!", "Cool!", "Oh yeah!"]
                
                lastMessageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber, upperValue: messages.count-1)
                message = messages[lastMessageNumber]

                lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, upperValue: numberOfImages-1)
                imageName = "image\(lastImageNumber)"
                
                lastSoundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, upperValue: numberOfSounds-1)
                playSound(soundName: "sound\(lastSoundNumber)")
            }
            .buttonStyle(.borderedProminent)
            .font(.title)
            
        }
        .padding()
    }
    
    func nonRepeatingRandom (lastNumber: Int, upperValue: Int) -> Int {
        var randomNumber: Int
        repeat { randomNumber = Int.random(in: 0...upperValue) } while randomNumber == lastNumber
        return randomNumber
    }
    
    func playSound(soundName: String) {
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("Could not read the file named \(soundName)")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("ERROR: \(error.localizedDescription) creating audioPlayer")
        }
    }
}

#Preview {
    ContentView()
}
