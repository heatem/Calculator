//
//  ContentView.swift
//  Calculator
//
//  Created by Heather Mason on 8/3/20.
//

import SwiftUI

enum CalculatorButton: String {
    
    case zero, one, two, three, four, five, six, seven, eight, nine
    case equals, plus, minus, multiply, divide
    case ac, plusMinus, percent
}

struct ContentView: View {
    let width = UIScreen.main.bounds.width / 5
    
    let buttons: [[CalculatorButton]] = [
        [.one, .two, .three, .plus],
        [.four, .five, .six, .minus],
        [.seven, .eight, .nine, .multiply],
        [.ac, .plusMinus, .percent, .divide]
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
                            Text(button.rawValue)
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
