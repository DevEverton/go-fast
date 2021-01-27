//
//  TimerCountDown.swift
//  GoFast
//
//  Created by Everton Carneiro on 17/01/21.
//

import SwiftUI

struct TimerCountDown: View {
    @State var seconds = 0
    @State var minutes = 1
    @State var hours = 0
    @State var isTimerActivated = false
    @State var isTimerPaused = false
    @State var timer: Timer? = nil
    @Binding var animationSeconds: CGFloat
    
    
    var body: some View {
        VStack {
            Text(clockString())
                .font(.custom("Avenir Next", size: 40))
                .fontWeight(.black)

            Button(action: {
                if !isTimerActivated {
                    startTimer()
                } else {
                    pauseTimer()
                }
            }) {
                Image(systemName: "playpause.fill")
                    .font(.system(size: 30, weight: .regular))
                    .foregroundColor(Color(.systemIndigo))
                    .padding(.all, 20)
                    .background(Color.white)
                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 5, y: 10)
                    .clipShape(Circle())
            }
        }

    }
    func startTimer() {
        animationSeconds = (CGFloat(minutes) * 60.0) - 1
        if !isTimerActivated {
            seconds = 59
            minutes -= 1
//            minutes = 59
//            hours -= 1
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ time in
                countDown()

            }
            isTimerActivated.toggle()
        }

    }
    
    func stopTimer(){
        
        timer?.invalidate()
        timer = nil
        isTimerActivated.toggle()

    }
    
    func pauseTimer() {
        isTimerPaused.toggle()
    }
    
    func clockString() -> String {
        let strSec = seconds <= 9 ? "0\(seconds)" : "\(seconds)"
        let strMin = minutes <= 9 ? "0\(minutes)" : "\(minutes)"
        let strHour = hours <= 9 ? "0\(hours)" : "\(hours)"
       
        return "\(strHour):\(strMin):\(strSec)"
    }
    
    func countDown() {
        if !isTimerPaused {
            if seconds > 0 {
                seconds -= 1
                animationSeconds -= 1
            }
            if seconds == 0 && minutes > 0 {
                seconds = 59
                minutes -= 1
            }
            
            if minutes == 0 && hours > 0 {
                if hours == 0 && minutes == 0 && seconds == 0 {
                    stopTimer()
                    isTimerActivated.toggle()
                }
                minutes = 59
                hours -= 1
            }
            
        }

    }
    

    
}

struct TimerCountDown_Previews: PreviewProvider {
    static var previews: some View {
        TimerCountDown(animationSeconds: .constant(200))
    }
}
