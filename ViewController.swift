//
//  ViewController.swift
//  safeEnergy1.0
//
//  Created by misha on 01.06.2022.
//
import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var switchScroll: NSSwitch!
    @IBOutlet weak var switchDock: NSSwitch!
    @IBOutlet weak var switchUTorrent: NSSwitch!
    @IBOutlet weak var switchAdGuard: NSSwitch!
    @IBOutlet weak var switchMagic: NSSwitch!
    @IBOutlet weak var offAllBtn: NSButtonCell!
    // функция запуска программы открытия / закрытия
    func shellCommandStartUser (userProcess:String) {
        let task = Process() // обьект позволяющий запускать другую программу в качестве подпроцесса (подпрогрмаммы, имеет свои потоки ввода вывода и потоки ошибок
        task.launchPath = "/usr/bin/open" // путь к исполняемому файлу, который мы хотим запустить
        task.arguments = ["/Applications/saveEnergy/\(userProcess).app"]
        task.launch() // запускает подпроцесс
        task.waitUntilExit() // передает управление потоками родителю и проверяет работает ли до сих пор родитель
    }
    
    override func viewDidAppear() {
        self.view.window?.styleMask.remove(NSWindow.StyleMask.resizable)
    }
    
    // перед сворачиванием
    override func viewWillDisappear() {
        switchScroll.state = NSControl.StateValue(rawValue: 0)
        switchDock.state = NSControl.StateValue(rawValue: 0)
        switchUTorrent.state = NSControl.StateValue(rawValue: 0)
        switchAdGuard.state = NSControl.StateValue(rawValue: 0)
        switchMagic.state = NSControl.StateValue(rawValue: 0)
    }
    // перед развертыванием
    override func viewWillAppear() {
        for runningApplication in NSWorkspace.shared.runningApplications {
            let appName = runningApplication.localizedName
            
            if appName! == "Scroll Reverser"  {
                switchScroll.state = NSControl.StateValue(rawValue: 1)
            }
            if appName! == "DockView"  {
                switchDock.state = NSControl.StateValue(rawValue: 1)
            }
            if appName! == "uTorrent Web"  {
                switchUTorrent.state = NSControl.StateValue(rawValue: 1)
            }
            if appName! == "AdGuard VPN"  {
                switchAdGuard.state = NSControl.StateValue(rawValue: 1)
            }
            if appName! == "Magic Control"  {
                switchMagic.state = NSControl.StateValue(rawValue: 1)
            }
        }
    }
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    //
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    //  изменилось занчение scroll
    @IBAction func scrollSwitchChanged(_ sender: Any) {
        if Bool (truncating: switchScroll.state as NSNumber) {
            shellCommandStartUser(userProcess: "startScroll")
        }
        else {
            shellCommandStartUser(userProcess: "stopScroll")
        } // else
    } // func
    // изменилось знаение dock
    @IBAction func dockSwitchChanged(_ sender: Any) {
        if Bool (truncating: switchDock.state as NSNumber) {
            shellCommandStartUser(userProcess: "startDock")
        }
        else {
            shellCommandStartUser(userProcess: "stopDock")
        } // else
    } // func
    //  изменилось значение торрент
    @IBAction func uTorrentSwitchChanged(_ sender: Any) {
        if Bool (truncating: switchUTorrent.state as NSNumber) {
            shellCommandStartUser(userProcess: "startTorrent")
        }
        else {
            shellCommandStartUser(userProcess: "stopTorrent")
        } // else
    } // func
    // изменилось значение эдГуард
    @IBAction func adGuardSwitchChanged(_ sender: Any) {
        if Bool (truncating: switchAdGuard.state as NSNumber) {
            shellCommandStartUser(userProcess: "startVpn")
        }
        else {
            shellCommandStartUser(userProcess: "stopVpn")
        } // else
    } // func
    // изменилось значение magic
    @IBAction func magicSwitchChanged(_ sender: Any) {
        if Bool (truncating: switchMagic.state as NSNumber) {
            shellCommandStartUser(userProcess: "startMagic")
        }
        else {
            shellCommandStartUser(userProcess: "stopMagic")
        } // else
    } // func
    
    @IBAction func btnOffClick(_ sender: Any) {
        switchScroll.state = NSControl.StateValue(rawValue: 0)
        switchDock.state = NSControl.StateValue(rawValue: 0)
        switchUTorrent.state = NSControl.StateValue(rawValue: 0)
        switchAdGuard.state = NSControl.StateValue(rawValue: 0)
        switchMagic.state = NSControl.StateValue(rawValue: 0)
        
        shellCommandStartUser(userProcess: "stopScroll")
        shellCommandStartUser(userProcess: "stopDock")
        shellCommandStartUser(userProcess: "stopTorrent")
        shellCommandStartUser(userProcess: "stopVpn")
        shellCommandStartUser(userProcess: "stopMagic")
    }
    /** Функция завершения процесса Steam */
    func shellCommandStopSteam(){
        for runningApplication in NSWorkspace.shared.runningApplications {
            
            let appName = runningApplication.localizedName
            
            
        } // for
    } // func
} // class
 



/*
 do
 {
    _ = try shellCommandStart ()
 }
 catch {
     print("\(error)")
 }

for runningApplication in NSWorkspace.shared.runningApplications {

let appName = runningApplication.localizedName
//testTextFild.title += appName!
//testTextFild.title += "\n"




if appName == "Magic Control" {
   // shellCommandStart()
    runningApplication.terminate()
    shellCommandStop(userProcess: "Scroll Reverser")
    testTextFild.title +=  "Scroll Reverser is \(runningApplication.isTerminated)"
    testTextFild.title += "\n"
}

if appName == "DockView" {
    runningApplication.terminate()
    shellCommandStop(userProcess: "DockView")
    testTextFild.title +=  "DockView is \(runningApplication.isTerminated)"
    testTextFild.title += "\n"
}
if appName == "Magic Control" {
    runningApplication.terminate()
    shellCommandStop(userProcess: "Magic Control")
    testTextFild.title +=  "Magic Control is \(runningApplication.isTerminated)"
    testTextFild.title += "\n"
}


} // for

*/
