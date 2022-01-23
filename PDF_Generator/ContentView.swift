//
//  ContentView.swift
//  PDF_Generator
//
//  Created by Stanley Pan on 2022/01/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var sharedData: SharedData = SharedData()
    
    var body: some View {
        MainView()
            .environmentObject(sharedData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


