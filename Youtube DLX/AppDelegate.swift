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
        download.launchPath = "/usr/local/bin/youtube-dl"
        download.arguments = [vidURL.stringValue]
        download.currentDirectoryPath = "~/Downloads/"
        download.launch()
        
    }
}

