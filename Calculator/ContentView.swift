//
//  ContentView.swift
//  Calculator
//
//  Created by Heather Mason on 8/3/20.
//

import SwiftUI

struct ContentView: View {
    let width = UIScreen.main.bounds.width / 5
    
    let buttons = [
        ["AC", "+/-", "%", "/"],
        ["7", "8", "9", "X"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
        [" ", "0", ".", "="]
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Spacer()
                    Text("70")
                        .font(.system(size: 72))
                        .foregroundColor(.white)
                }.padding()
                
                ForEach(buttons, id: \.self) { row in
                    HStack {
                        ForEach(row, id: \.self) { button in
                            Text(button)
                                .font(.system(size: 32))
                                .frame(width: width, height: width)
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(width)
                        }
                    }.padding(10)
                }
            }.padding(.bottom, 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
