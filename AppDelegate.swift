//
//  AppDelegate.swift
//  safeEnergy1.0
//
//  Created by misha on 01.06.2022.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    // закрывает приложение при нажатии на кнопку закрытия приложения 
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        NSApplication.shared.terminate(self)
        return true
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

