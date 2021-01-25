//
//  ContentView.swift
//  Shared
//
//  Created by Everton Carneiro on 17/01/21.
//

import SwiftUI

struct ContentView: View {
    @State var animationSeconds: CGFloat
    
    var body: some View {
        ZStack {
            CircularTimerAnimation(width: 350, height: 350, progressCircle: 57600.0 - animationSeconds, fastTime: animationSeconds)
            TimerCountDown(animationSeconds: $animationSeconds)


        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(animationSeconds: 57600.0)
    }
}
