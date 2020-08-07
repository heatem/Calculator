//
//  ContentView.swift
//  Calculator
//
//  Created by Heather Mason on 8/3/20.
//

import SwiftUI

enum CalculatorButton: String {
    
    case zero, one, two, three, four, five, six, seven, eight, nine, decimal
    case equals, plus, minus, multiply, divide
    case ac, plusMinus, percent
    
    var title: String {
        switch self {
        case .zero: return "0"
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .decimal: return "."
        case .equals: return "="
        case .plus: return "+"
        case .minus: return "-"
        case .multiply: return "x"
        case .divide: return "/"
        case .ac: return "AC"
        case .plusMinus: return "+/-"
        case .percent: return "%"
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .decimal:
            return Color(.systemBlue)
        case .ac, .plusMinus, .percent:
            return Color(.blue)
        default:
            return .purple
        }
    }
}

class GlobalEnvironment: ObservableObject {
    @Published var display = " "
    @Published var result = " "
    
    func receiveInput(button: CalculatorButton) {
        self.display += button.title
    }
    
    // TODO: add function to calculate
}

struct ContentView: View {
    let width = UIScreen.main.bounds.width / 5
    
    @EnvironmentObject var env: GlobalEnvironment
    
    let buttons: [[CalculatorButton]] = [
        [.ac, .plusMinus, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .decimal, .equals]
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Spacer()
                    Text(env.display)
                        .font(.system(size: 32))
                        .foregroundColor(.gray)
                }
                .padding(.top)
                .padding(.trailing)
                
                HStack {
                    Spacer()
                    Text(env.result)
                        .font(.system(size: 72))
                        .foregroundColor(.white)
                }.padding()
                
                ForEach(buttons, id: \.self) { row in
                    HStack {
                        ForEach(row, id: \.self) { button in
                            Button(action: {
                                self.env.receiveInput(button: button)
                            }) {
                                Text(button.title)
                                    .font(.system(size: 32))
                                    .frame(width: button != .zero ? width : (width * 2.2) , height: width)
                                    .foregroundColor(.white)
                                    .background(button.backgroundColor)
                                    .cornerRadius(width)
                            }
                        }
                    }.padding(10)
                }
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GlobalEnvironment())
    }
}
