//
//  TimerCountDown.swift
//  GoFast
//
//  Created by Everton Carneiro on 17/01/21.
//

import SwiftUI

struct TimerCountDown: View {
    @State var timeRemaining = 100
    @State var seconds = 0
    @State var minutes = 0
    @State var hours = 1
    @State var isTimerActivated = false
    @State var isTimerPaused = false
    @State var timer: Timer? = nil
    
    init() {
        startTimer()
    }
    
    var body: some View {
        VStack {
            Text(clockString())
                .font(.custom("Avenir Next", size: 30))
                .fontWeight(.black)

            Button(action: {
                startTimer()
            }){
                Text("start")
                
            }
            Button(action: {
                pauseTimer()

            }){
                Text("pause")
                
            }
            
        }

    }
    
    func startTimer() {
        if !isTimerActivated {
            seconds = 59
            minutes = 59
            hours -= 1
            timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true){ time in
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
            }
            if seconds == 0 && minutes > 0 {
                seconds = 59
                minutes -= 1
            }
            if minutes == 0 && hours > 0 {
                if hours == 0 && minutes == 0 && seconds == 0 {
                    stopTimer()
                    isTimerActivated.toggle()
                } else {
                    hours -= 1
                }
            }
        }

    }
    
}

struct TimerCountDown_Previews: PreviewProvider {
    static var previews: some View {
        TimerCountDown()
    }
}
