//
//  ViewController.swift
//  Tap Me
//
//  Created by Clayton Harper on 2/1/16.
//  Copyright © 2016 Clayton Harper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var timerLabel: UILabel!
    
    var count: Int = 0
    var seconds: Int = 0
    var timer:NSTimer = NSTimer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupGame() {
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("subtractTime"), userInfo: nil, repeats: true)
        
        seconds = 30
        count = 0
        timerLabel.text = "Time: \(seconds)"
        scoreLabel.text = "Score: \(count)"
    }
    
    func subtractTime() {
        seconds--
        timerLabel.text = "Time: \(seconds)"
        
        if seconds == 0 {
            timer.invalidate()
            let alert = UIAlertController(
                title: "Time is up!",
                message: "You Scored \(count) points",
                preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(
                title: "Play Again",
                style: UIAlertActionStyle.Default,
                handler: { action in self.setupGame() }
            ))
            presentViewController(alert, animated: true, completion: nil)
        }
    }

        

    @IBAction func buttonPressed() {
        count++
        scoreLabel.text = "Score \n\(count)"
    }
    
}

