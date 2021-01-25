//
//  CircularTimerAnimation.swift
//  GoFast
//
//  Created by Everton Carneiro on 17/01/21.
//

import SwiftUI

struct CircularTimerAnimation: View {
    
    var color1 = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
    var color2 = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
    var width: CGFloat
    var height: CGFloat
    var progressCircle: CGFloat
    var fastTime: CGFloat

    var body: some View {
        let progress = CGFloat((fastTime - progressCircle)/fastTime)
        
        return VStack {
            ZStack {
                Circle()
                    .stroke(Color.blue.opacity(0.2), style:
                                StrokeStyle(lineWidth: 15))
                    .frame(width: width, height: height)
                Circle()
                    .trim(from: progress, to: 1.0)
                    .stroke(LinearGradient(gradient: Gradient(colors: [Color(color1), Color(color2)]), startPoint: .topTrailing, endPoint: .bottomLeading), style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [], dashPhase: 0))
                    .rotationEffect(Angle(degrees: 90))
                    .rotation3DEffect(Angle(degrees: 180),axis: (x: 1, y: 0, z: 0))
                    .frame(width: width, height: height)
                    .shadow(color: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)).opacity(0.1), radius: 3, x: 0, y: 3)
                    .animation(.easeInOut(duration: 1.5))
                
//                Text("\(Int(sliderValue))%")
//                    .font(.system(size: 40))
//                    .fontWeight(.bold)
                    
            }
//            Text("\(sliderValue)")
//            Text("\(progress)")
//
//            Slider(value: $sliderValue, in: 0...16, step: 1.0)
//                .padding(.top, 50)
//                .frame(width: 300)
//                .accentColor(Color(color1))
        }
    }
}

struct CircularTimerAnimation_Previews: PreviewProvider {
    static var previews: some View {
        CircularTimerAnimation(width: 350, height: 350, progressCircle: 0.0, fastTime: 16.0)
    }
}
