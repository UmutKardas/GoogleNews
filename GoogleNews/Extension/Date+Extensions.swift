//
//  Date+Extensions.swift
//  GoogleNews
//
//  Created by Hüseyin Umut Kardaş on 3.01.2025.
//

import Foundation

extension Date {
    func timeAgo() -> String {
        let calendar = Calendar.current
        let now = Date()
        let components = calendar.dateComponents([.second, .minute, .hour, .day], from: self, to: now)

        if let days = components.day, days > 0 {
            return "\(days)d \(components.hour ?? 0)h"
        }

        if let hours = components.hour, hours > 0 {
            return "\(hours)h \(components.minute ?? 0)m"
        }

        if let minutes = components.minute, minutes > 0 {
            return "\(minutes)m"
        }

        return "\(components.second ?? 0)s"
    }
}
