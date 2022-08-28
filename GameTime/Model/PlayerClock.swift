//
//  Clock.swift
//  GameClock
//
//  Created by Jaime Lucea on 18/8/22.
//

import Foundation
import UIKit

class PlayerClock {
    
    let name : String
    let color : UIColor
    
    var timer : Timer?
    let maxTimeSeconds : Int
    var isPaused : Bool
    var remainingSeconds : Int
    
    var listener : ClockListener?
    
    init(name: String, color: UIColor, maxTime: Int, listener: ClockListener?){
        self.name = name
        self.color = color
        self.maxTimeSeconds = maxTime
        self.isPaused = true
        self.remainingSeconds = maxTimeSeconds
        self.listener = listener
    }
    
    func start(){
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(tick)), userInfo: nil, repeats: true)
        self.isPaused = false
        print("Player clock '" + name + "' started")
    }
    
    func pause(){
        if timer != nil {
            print("Player clock '" + name + "' paused")
            self.isPaused = true
            self.timer!.invalidate()
        }
    }
    
    func resume(){
        if (timer != nil) && (self.isPaused) {
            print("Player clock '" + name + "' resumed")
            self.isPaused = false
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(tick)), userInfo: nil, repeats: true)
        }
    }
    
    @objc private func tick(){
        if self.remainingSeconds > 0 {
            self.remainingSeconds -= 1
            print(name + ": tic (" + String(remainingSeconds) + ")")
            listener?.onClockTick(clock: self)
        }else{
            self.timer?.invalidate()
        }
    }
    
    //
    // Returns 0 to 1, where 1 is 100% completion (0 secs left)
    //
    func getProgress() -> Float {
        return 1-Float(remainingSeconds)/Float(maxTimeSeconds)
    }
    
    //
    // Returns String representation of current time e.g. 01:04:48
    //
    func getTimeString() -> String {
        let time = TimeInterval(remainingSeconds)
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    func setListener(_ listener: ClockListener){
        self.listener = listener
    }
    
}
