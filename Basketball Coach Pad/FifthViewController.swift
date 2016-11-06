//
//  FifthViewController.swift
//  Basketball Coach Pad
//
//  Created by Arkadijs Makarenko on 03/10/2016.
//  Copyright © 2016 ArchieApps. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {

    //home
    @IBOutlet weak var homeScore: UILabel!
    var score: Int = 0
    
    func didScore(points:Int){
        score += points
        homeScore.text = "HOME:\(score)"
    }
    
    @IBAction func freeThrow(_ sender: AnyObject) {
        didScore(points: 1)
    }
    
    @IBAction func twoPoints(_ sender: AnyObject) {
        didScore(points: 2)
    }
    
    @IBAction func threePoints(_ sender: AnyObject) {
        didScore(points: 3)
    }
    
    @IBAction func minusOne(_ sender: AnyObject) {
        didScore(points: -1)
    }
    
    //Guest
    
    @IBOutlet weak var guestScore: UILabel!
    
    var score1: Int = 0
    
    func didScore1(points:Int){
        score1 += points
        guestScore.text = " \(score1):AWAY"
    }
    @IBAction func freeThrow1(sender: AnyObject) {
        didScore1(points: 1)
    }
    @IBAction func twoPoints1(sender: AnyObject) {
        didScore1(points: 2)
    }
    @IBAction func threePoints1(sender: AnyObject) {
        didScore1(points: 3)
    }
    @IBAction func minusOne1(sender: AnyObject) {
        didScore1(points: -1)
    }
    
    @IBAction func resetHome(_ sender: AnyObject) {
        score = 0
        homeScore.text = "HOME:\(score)"
    }
    
    @IBAction func resetGuest(_ sender: AnyObject) {
            score1 = 0
            guestScore.text = " \(score1):AWAY"
    }
    
    //timing
    @IBOutlet weak var countLabel: UILabel!
    
    var timer = Timer()
    var total = TimeInterval()
    var lastInterval = TimeInterval()
    
    @IBAction func pauseButton(_ sender: AnyObject) {
        if !timer.isValid{
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector:#selector(updateCounter), userInfo: nil, repeats: true)
            lastInterval = NSDate.timeIntervalSinceReferenceDate
        }else{
            timer.invalidate()
            
        }
    }
    @IBAction func resetTime(_ sender: AnyObject) {
        timer.invalidate()
        countLabel.text = "00:00:00"
        total = TimeInterval()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.didScore(points: 0)
        self.didScore1(points: 0)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateCounter() {
        let count = getTimerCounter()
        let min = count.minutes
        let sec = count.seconds
        let mil = count.milliseconds
        countLabel.text = "\(min):\(sec):\(mil)"
    }
    func getTimerCounter() -> (minutes:String, seconds:String, milliseconds:String) {
        let start = NSDate.timeIntervalSinceReferenceDate
        total += start - lastInterval
        lastInterval = start
        var displayTime = total
        //calc min
        let min = Int(displayTime / 60.0)
        displayTime -= (TimeInterval(min) * 60)
        let minString = String(format: "%02d", min)
        //calc sec
        let sec = Int(displayTime)
        displayTime -= (TimeInterval(sec))
        let secString = String(format: "%02d", sec)
        //calc mil
        let mil = Int(displayTime * 100.0)
        let milString = String(format: "%02d", mil)
        
        return (minString, secString, milString)
        
    }
    
}

