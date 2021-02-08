//
//  TimerView.swift
//  GoFast
//
//  Created by Everton Carneiro on 08/02/21.
//

import SwiftUI

struct TimerView: View {
    @State var animationSeconds: CGFloat = 0
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("background"))
                .edgesIgnoringSafeArea(.all)
            CircularTimerAnimation(width: 350, height: 350, progressCircle: animationSeconds, fastTime: 57600)
            TimerCountDown(animationSeconds: $animationSeconds)
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(animationSeconds: 0)
    }
}
