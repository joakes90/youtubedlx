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
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    @IBOutlet weak var vidURL: NSTextField!

    @IBAction func downloadVid(sender: AnyObject) {
        var download = NSTask()
        var cliApp = NSBundle.mainBundle().resourcePath?.stringByAppendingPathComponent("youtube-dl")
        var url = vidURL.stringValue
        var downloadDir = "~/Downloads/".stringByStandardizingPath
        
        download.launchPath = cliApp!
        download.arguments = [url]
        download.currentDirectoryPath = downloadDir
        download.launch()
        
    }
}

