//
//  KZLogger.swift
//  KZLogger
//
//  Created by Zonily Jame Pesquera on 07/11/2016.
//  Copyright © 2016 kz. All rights reserved.
//

import UIKit

open class KZLogger {
    fileprivate static let shared = KZLogger()
    fileprivate var showLog:Bool = false
    fileprivate var appName:String = "KZLogger"
    fileprivate var showFileNames:Bool = false
    fileprivate var showFunctionNames:Bool = false
    fileprivate var showApiLogs:Bool = false
    
    fileprivate var showDate:Bool = false
    
    open static func configure(showLogs bool:Bool, appName:String) -> KZLogger {
        return configure(showLogs: bool, appName: appName, showFileNames: false, showFunctionNames: false, showDate: false, showApiLogs: false)
    }
    
    open static func configure(showLogs bool:Bool, appName:String, showFileNames:Bool, showFunctionNames:Bool, showDate:Bool, showApiLogs:Bool) -> KZLogger {
        KZLogger.shared.showLog = bool
        KZLogger.shared.appName = appName
        
        KZLogger.shared.showFileNames = showFileNames
        
        KZLogger.shared.showFunctionNames = showFunctionNames
        KZLogger.shared.showDate = showDate
        KZLogger.shared.showApiLogs = showApiLogs
        return KZLogger.shared
    }
    
    open func show(_ items: Any..., file: String = #file, function: String = #function, line: Int = #line) {
        var printString:String = "↘️ "
        
        if showDate {
            printString += "\(Date()) "
        }
        
        printString += "<\(KZLogger.shared.appName)> "
        
        if showFileNames {
            printString += "\(URL(string: file)!.lastPathComponent):\(line) "
        }
        
        if showFunctionNames {
            printString += "<FunctionName:\(function)> "
        }
        
        for item in items {
            printString += "\(item) "
        }
        
        print(printString)
    }
    
    open func debug(_ items: Any..., file: String = #file, function: String = #function, line: Int = #line) {
        switch showLog {
        case true:
            show(items, file: file, function: function, line: line)
        case false:
            break
        }
    }
    
    open func apiPrint(_ items: Any..., file: String = #file, function: String = #function, line: Int = #line) {
        switch showLog {
        case true:
            var printString:String = "↘️JSON↘️ "
            
            if showDate {
                printString += "\(Date()) "
            }
            
            printString += "<\(KZLogger.shared.appName)> "
            
            if showFileNames {
                printString += "\(URL(string: file)!.lastPathComponent):\(line) "
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
        case .black: return "Black"
        case .red: return "Red"
        case .green: return "Green"
        case .yellow: return "Yellow"
        case .blue: return "Blue"
        case .magenta: return "Magenta"
        case .cyan: return "Cyan"
        case .white: return "White"
        }
    }
    
    public static func all() -> [KZLogColor] {
        return [.black, .red, .green, .yellow, .blue, .magenta, .cyan, .white]
    }
}
