//
//  ContentView.swift
//  PDF_Generator
//
//  Created by Stanley Pan on 2022/01/23.
//

import SwiftUI

struct ContentView: View {
    let screen = UIScreen.main.bounds
    
    var body: some View {
        VStack {
            Text("This is an example controller with content.")
            
            HStack {
                Rectangle()
                    .foregroundColor(Color.blue)
                    .frame(width: 200, height: 200)
                
                Rectangle()
                    .foregroundColor(Color.red)
                    .frame(width: 200, height: 200)
            }
            
            Spacer()
                .frame(width: screen.width, height: 60)
            
            Button(action: {
                print("Button was pressed.")
                print(convertToScrollView(content: {
                    self
                }).contentSize)
            }, label: {
                Image(systemName: "square.and.arrow.up.fill")
                    .font(.title2)
                    .foregroundColor(Color.black.opacity(0.7))
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
