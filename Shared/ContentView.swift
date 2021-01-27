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
            CircularTimerAnimation(width: 350, height: 350, progressCircle: 60 - animationSeconds, fastTime: 60)
            TimerCountDown(animationSeconds: $animationSeconds)
                .offset(y: 10)


        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(animationSeconds: 60)
            .preferredColorScheme(.light)
    }
}
