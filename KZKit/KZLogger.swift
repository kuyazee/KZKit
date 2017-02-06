//
//  KZLogger.swift
//  KZLogger
//
//  Created by Zonily Jame Pesquera on 07/11/2016.
//  Copyright © 2016 kz. All rights reserved.
//

import UIKit

public class KZLogger {
    private static var sharedInstance = KZLogger()
    private var showLog:Bool = false
    private var appName:String = "KZLogger"
    private var showFileNames:Bool = false
    private var showFunctionNames:Bool = false
    private var showApiLogs:Bool = false
    
    private var showDate:Bool = false
    
    public static func configure(showLogs bool:Bool, appName:String) -> KZLogger {
        return configure(showLogs: bool, appName: appName, showFileNames: false, showFunctionNames: false, showDate: false, showApiLogs: false)
    }
    
//    public static func configure(showLogs bool:Bool, appName:String) -> KZLogger {
//        
//    }
    
    public static func configure(showLogs bool:Bool, appName:String, showFileNames:Bool, showFunctionNames:Bool, showDate:Bool, showApiLogs:Bool) -> KZLogger {
        KZLogger.sharedInstance.showLog = bool
        KZLogger.sharedInstance.appName = appName
        
        KZLogger.sharedInstance.showFileNames = showFileNames
        
        KZLogger.sharedInstance.showFunctionNames = showFunctionNames
        KZLogger.sharedInstance.showDate = showDate
        KZLogger.sharedInstance.showApiLogs = showApiLogs
        return KZLogger.sharedInstance
    }
    
    public func debug(items: Any..., file: String = #file, function: String = #function, line: Int = #line) {
        switch showLog {
        case true:
            var printString:String = "↘️ "
            
            if showDate {
                printString += "\(NSDate()) "
            }
            
            printString += "<\(KZLogger.sharedInstance.appName)> "
            
            if showFileNames {
                printString += "\(NSURL(string: file)!.lastPathComponent!):\(line) "
            }
            
            if showFunctionNames {
                printString += "<FunctionName:\(function)> "
            }
            
            for item in items {
                printString += "\(item) "
            }
            
            print(printString)
        case false:
            break
        }
    }
    
    public func apiPrint(items: Any..., file: String = #file, function: String = #function, line: Int = #line) {
        switch showLog {
        case true:
            var printString:String = "↘️JSON↘️ "
            
            if showDate {
                printString += "\(NSDate()) "
            }
            
            printString += "<\(KZLogger.sharedInstance.appName)> "
            
            if showFileNames {
                printString += "\(NSURL(string: file)!.lastPathComponent!):\(line) "
            }
            
//            if showFunctionNames {
            printString += "<FunctionName:\(function)> "
//            }
            
            for item in items {
                printString += "\(item) "
            }
            
            if showApiLogs {
                print(printString)
            }
        case false:
            break
        }
    }
}

public enum KZLogColor: String {
    case black = "\u{001B}[0;30m"
    case red = "\u{001B}[0;31m"
    case green = "\u{001B}[0;32m"
    case yellow = "\u{001B}[0;33m"
    case blue = "\u{001B}[0;34m"
    case magenta = "\u{001B}[0;35m"
    case cyan = "\u{001B}[0;36m"
    case white = "\u{001B}[0;37m"
    
    public func name() -> String {
        switch self {
        case black: return "Black"
        case red: return "Red"
        case green: return "Green"
        case yellow: return "Yellow"
        case blue: return "Blue"
        case magenta: return "Magenta"
        case cyan: return "Cyan"
        case white: return "White"
        }
    }
    
    public static func all() -> [KZLogColor] {
        return [.black, .red, .green, .yellow, .blue, .magenta, .cyan, .white]
    }
}
