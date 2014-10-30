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
        var appSupport = "~/Library/Application Support/Youtube DLX/youtube-dl"
        appSupport = appSupport.stringByStandardizingPath
        var binExsists = NSFileManager.defaultManager().fileExistsAtPath(appSupport)
        if(!binExsists){
            var path = NSBundle.mainBundle().resourcePath?.stringByAppendingPathComponent("youtube-dl")
            var destination = "~/Library/Application Support/Youtube DLX/"
            var destinationPath = destination.stringByStandardizingPath
            NSFileManager.defaultManager().createDirectoryAtPath(destinationPath, withIntermediateDirectories: true, attributes: nil, error: nil)
            
            var moveBin = NSTask()
            moveBin.launchPath = "/bin/cp"
            moveBin.arguments = [path!, destinationPath]
            moveBin.launch()
           
        }
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    @IBOutlet weak var vidURL: NSTextField!

    @IBAction func downloadVid(sender: AnyObject) {
        var download = NSTask()
        var cliApp = "~/Library/Application Support/Youtube DLX/youtube-dl"
        cliApp = cliApp.stringByStandardizingPath
        
        download.launchPath = cliApp
        download.arguments = [vidURL.stringValue]
        download.currentDirectoryPath = "/Users/justinoakes/Downloads/"
        download.launch()
        
    }
}

