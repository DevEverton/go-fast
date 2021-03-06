//
//  ContentView.swift
//  Shared
//
//  Created by Everton Carneiro on 17/01/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            Text("Progresso")
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Progresso")
                }
            TimerView()
                .tabItem {
                Image(systemName: "timer")
                Text("Timer")

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()    
            .preferredColorScheme(.dark)
    }
}
