//
//  DateExtension.swift
//  dear
//
//  Created by kyungtaek on 2017. 2. 13..
//  Copyright © 2017년 sicamp. All rights reserved.
//

import Foundation

extension Date {

    func getBirthdayElements() -> (year: Int?, month: Int?, day: Int?) {
        let calendar = Calendar(identifier: .gregorian)
        let dateComponent = calendar.dateComponents([.day, .month, .year], from: self)
        return (year:dateComponent.year, month:dateComponent.month, day:dateComponent.day)
    }

    func getBirthdayString() -> String {
        let elements = self.getBirthdayElements()
        return "\(elements.year)-\(elements.month)-\(elements.day)"
    }


    func format(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }

    func timeAgoSinceDate(numericDates: Bool = false) -> String {
        let calendar = NSCalendar.current
        let unitFlags: Set<Calendar.Component> = [.minute, .hour, .day, .weekOfYear, .month, .year, .second]
        let now = Date()
        let earliest = now < self ? now : self
        let latest = (earliest == now) ? self : now
        let components = calendar.dateComponents(unitFlags, from: earliest, to: latest)

        if (components.year! >= 2) {
            return "\(components.year!) years ago"
        } else if (components.year! >= 1) {
            if (numericDates) {
                return "1 year ago"
            } else {
                return "Last year"
            }
        } else if (components.month! >= 2) {
            return "\(components.month!) months ago"
        } else if (components.month! >= 1) {
            if (numericDates) {
                return "1 month ago"
            } else {
                return "Last month"
            }
        } else if (components.weekOfYear! >= 2) {
            return "\(components.weekOfYear!) weeks ago"
        } else if (components.weekOfYear! >= 1) {
            if (numericDates) {
                return "1 week ago"
            } else {
                return "Last week"
            }
        } else if (components.day! >= 2) {
            return "\(components.day!) days ago"
        } else if (components.day! >= 1) {
            if (numericDates) {
                return "1 day ago"
            } else {
                return "Yesterday"
            }
        } else if (components.hour! >= 2) {
            return "\(components.hour!) hours ago"
        } else if (components.hour! >= 1) {
            if (numericDates) {
                return "1 hour ago"
            } else {
                return "An hour ago"
            }
        } else if (components.minute! >= 2) {
            return "\(components.minute!) minutes ago"
        } else if (components.minute! >= 1) {
            if (numericDates) {
                return "1 minute ago"
            } else {
                return "A minute ago"
            }
        } else if (components.second! >= 3) {
            return "\(components.second!) seconds ago"
        } else {
            return "Just now"
        }

    }
}
