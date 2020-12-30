//
//  Helpers.swift
//  BookStore_MojtabaMirzadeh
//
//  Created by Mojtaba Mirzadeh on 10/9/1399 AP.
//

import Foundation

// TODO: Fix Response Log
var xprintIndex = 0

enum XprintType: String {
    case error = "🚑"
    case warning = "⚠️"
    case info = "ℹ️"
    case debug = "🔨"
}

func xprint(_ items: Any..., type: XprintType = .debug, file: String = #file, line: Int = #line) {
    
    let fileUrl = URL(string: file)
    let filename = fileUrl?.lastPathComponent ?? ""
    
    print("---[\(type.rawValue) \(xprintIndex).𝙓𝙋𝙍𝙄𝙉𝙏 @ \(filename):\(line) \(type.rawValue)]---")
    for item in items {
        print(item)
    }
    print(String(repeating: "-", count: 66))
    xprintIndex += 1
}
