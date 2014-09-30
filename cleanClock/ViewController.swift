//
//  ViewController.swift
//  cleanClock
//
//  Created by Adam Schuld on 9/29/14.
//  Copyright (c) 2014 Design Gumption. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var hourHand: UIImageView!
    @IBOutlet weak var minuteHand: UIImageView!
    @IBOutlet weak var secondHand: UIImageView!
    var timer : NSTimer = NSTimer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.hourHand.layer.anchorPoint = CGPointMake(0.5, 0.9)
        self.minuteHand.layer.anchorPoint = CGPointMake(0.5, 0.9)
        self.secondHand.layer.anchorPoint = CGPointMake(0.5, 0.9)

        
        // start timer
        self.timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "tick", userInfo: nil, repeats: true)
        self.tick()
        
    }
    
    func tick(){
        // convert time to hours, minutes and seconds
        var calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        
        var units = NSCalendarUnit.CalendarUnitHour | NSCalendarUnit.CalendarUnitMinute | NSCalendarUnit.CalendarUnitSecond
        
        var components = calendar.components(units, fromDate: NSDate())
        
        // calculate hour, minutes, seconds
        var hoursAngle = CGFloat((Double)(components.hour) / 12.0 * M_PI * 2.0)
        var minutesAngle = CGFloat((Double)(components.minute) / 60.0 * M_PI * 2.0)
        var secondsAngle = CGFloat((Double)(components.second) / 60.0 * M_PI * 2.0)
        
        // rotate hands
        self.hourHand.transform = CGAffineTransformMakeRotation(hoursAngle)
        self.minuteHand.transform = CGAffineTransformMakeRotation(minutesAngle)
        self.secondHand.transform = CGAffineTransformMakeRotation(secondsAngle)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

