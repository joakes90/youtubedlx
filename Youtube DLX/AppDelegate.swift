//
//  AppDelegate.swift
//  Youtube DLX
//
//  Created by Justin Oakes on 10/23/14.
//  Copyright (c) 2014 Justin Oakes. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        var lastUpdate = NSUserDefaults.standardUserDefaults().doubleForKey("date")
        var today = NSDate.timeIntervalSinceReferenceDate()
        
        if (today.advancedBy(-604800) >= lastUpdate){
            update(self)
        }
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    @IBOutlet weak var vidURL: NSTextField!
    @IBOutlet weak var spinner: NSProgressIndicator!
    var download: NSTask!
    var timer: NSTimer!
    
    @IBAction func downloadVid(sender: AnyObject) {
        download = NSTask()
        
        var cliApp = NSBundle.mainBundle().resourcePath?.stringByAppendingPathComponent("youtube-dl")
        var url = vidURL.stringValue
        var downloadDir = "~/Downloads/".stringByStandardizingPath
        
        download.launchPath = cliApp!
        download.arguments = [url]
        download.currentDirectoryPath = downloadDir
        download.launch()
        spinner.startAnimation(self)
        timer = NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: "toggleSpinner", userInfo: nil, repeats: true)
        
    }
    
    @IBAction func update(sender: AnyObject) {
        var cliApp = NSBundle.mainBundle().resourcePath?.stringByAppendingPathComponent("youtube-dl")
        var update = NSTask()
        
        update.launchPath = cliApp!
        update.arguments = ["--update"]
        update.launch()
        
        while(update.running){
            spinner.startAnimation(self)
        }
        spinner.stopAnimation(self)
        NSUserDefaults.standardUserDefaults().setObject(NSDate.timeIntervalSinceReferenceDate(), forKey: "date")
    }
    
    func toggleSpinner() {
        if(!download.running){
            spinner.stopAnimation(self)
            timer.invalidate()
        }
    }
}

