//
//  TimerCountDown.swift
//  GoFast
//
//  Created by Everton Carneiro on 17/01/21.
//

import SwiftUI



struct TimerCountDown: View {
    @State var seconds = 0
    @State var minutes = 0
    @State var hours = 16
    @State var isTimerActivated = false
    @State var isTimerPaused = false
    @State var timer: Timer? = nil
    @Binding var animationSeconds: CGFloat
    @State var buttonIsDisable = false
    @State var buttonBackground = Color("button")
    @State var buttonForeground = Color(#colorLiteral(red: 0.3058823529, green: 0.2392156863, blue: 0.3254901961, alpha: 1))
    
    
    var body: some View {
        VStack {
            Button(action: {
                stopTimer()
                enableButton()
                resetTimer()

            }){
                Image(systemName: "stop.circle")
                    .font(.system(size: 30, weight: .regular))
                    .padding(8)
                    .foregroundColor(Color(#colorLiteral(red: 0.3058823529, green: 0.2392156863, blue: 0.3254901961, alpha: 1)))
                    .background(Color("button"))
                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 5, y: 10)
                    .clipShape(Circle())

            }
            .padding(.leading, 320)

            
            Spacer()
            Text(clockString())
                .font(.custom("Avenir Next", size: 40))
                .fontWeight(.black)
                .padding(.vertical, 10)
                .foregroundColor(.white)
            

            Button(action: {
                if !isTimerActivated {
                    startTimer()
                    disableButton()
                }
            }) {
                Image(systemName: "play.fill")
                    .font(.system(size: 30, weight: .regular))
                    .foregroundColor(buttonForeground)
                    .padding(.all, 20)
                    .background(buttonBackground)
                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 5, y: 10)
                    .clipShape(Circle())
            }
            .disabled(buttonIsDisable)
            .animation(.easeInOut(duration: 1.0))
            Spacer()

        }

    }

    
    func disableButton() {
        buttonIsDisable = true
        buttonBackground = Color.gray
        buttonForeground = Color.white

    }
    
    func enableButton() {
        buttonIsDisable = false
        buttonBackground = Color("button")
        buttonForeground = Color(#colorLiteral(red: 0.3058823529, green: 0.2392156863, blue: 0.3254901961, alpha: 1))
        
    }
    
    func startTimer() {
        animationSeconds = 0
        if !isTimerActivated {
            seconds = 59
            minutes = 59
            hours -= 1
            timer = Timer.scheduledTimer(withTimeInterval: 0.00001, repeats: true){ time in
                countDown()

            }
            isTimerActivated.toggle()
        }

    }
    
    func stopTimer(){
        
        timer!.invalidate()
        timer = nil
        isTimerActivated.toggle()
        animationSeconds = 0

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
            if isTimerActivated {
                animationSeconds += 1
                print("Animation Seconds: \(animationSeconds)")
            }
            
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
                }
                minutes = 59
                hours -= 1
            }
            
        }

    }
    
    func resetTimer() {
        hours = 16
        minutes = 0
        seconds = 0
        animationSeconds = 0
    }
    

    
}

struct TimerCountDown_Previews: PreviewProvider {
    static var previews: some View {
        TimerCountDown(animationSeconds: .constant(200))
    }
}
