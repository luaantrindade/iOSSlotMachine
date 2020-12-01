//
//  ContentView.swift
//  Slots Machine
//
//  Created by Jeff on 24/11/2020.
//  Copyright © 2020 Jeff Inc. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var symbols = ["apple","star","cherry"]
    @State private var numbers = [1,2,0]
    @State private var credits = 1000
    private var betAmount = 5
    @State private var showingAlert: Bool = false
    
    
    var body: some View {
        
        ZStack {
            
            // Background
            Rectangle()
                .foregroundColor(Color(red: 200/255,
                                       green: 143/255,
                                       blue: 32/255
                ))
                .edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .foregroundColor(Color(red: 228/255,
                                       green: 195/255,
                                       blue: 76/255
                ))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Spacer()
                
                //Title
                HStack {
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .scaleEffect(1.5)
                    
                    Text("Slot Machine")
                        .bold()
                        .font(.title)
                        .foregroundColor(.white)
                    
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .scaleEffect(1.5)
                    
                }
                
                Spacer()
                
                //Credits
                Text("Credits:" + String(credits))
                    .foregroundColor(.black)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                
                Spacer()
                //Cards
                HStack {
                    
                    Spacer()
                    
                    CardView(symbol: $symbols[numbers[0]])
                    CardView(symbol: $symbols[numbers[1]])
                    CardView(symbol: $symbols[numbers[2]])
                    
                    Spacer()
                }
                
                Spacer()
                
                //Test
                
                
                
                
                
                //Spin Button
                Button(action: {
                    
                    
                    
                    //Changes the images
                    self.numbers[0] = Int.random(in: 0...self.symbols.count - 1)
                    
                    self.numbers[1] = Int.random(in: 0...self.symbols.count - 1)
                    
                    self.numbers[2] = Int.random(in: 0...self.symbols.count - 1)
                    
                    //Check winnings
                    if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2] {
                        //Won Alert
                        
                        
                        self.showingAlert = true
                        
                        //Won
                        self.credits += self.betAmount * 10
                    }
                    else {
                        //Lose
                        self.credits -= self.betAmount
                    }
                    
                }) {
                    
                    Text("                        Spin                        ")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.all,15)
                        .background(Color.pink)
                        .cornerRadius(30)
                }.alert(isPresented: $showingAlert) {
                    Alert(title: Text("You Won!!!"), message: Text(String("50") + " credits"), dismissButton: .default(Text("OK")))
                        
                }
                
                Spacer()
                
                
                
            }
            
        }
        
        
        
        
        
        
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
