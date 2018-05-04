//
//  Sort.swift
//  WarpFactor
//
//  Created by Thibault Wittemberg on 18-04-30.
//  Copyright © 2018 WarpFactor. All rights reserved.
//

import Foundation


func to24 (input: String) -> String {
    let timeItems = input.split(separator: ":")
    let hour = timeItems[0]
    let minute = timeItems[1]
    let second = timeItems[2].prefix(2)
    let indicator = timeItems[2].suffix(2)

    if indicator == "AM" {
        // morning
        if hour == "12" {
            return "00:\(minute):\(second)"
        }
    } else if indicator == "PM" {
        if hour == "12" {
            return "12:\(minute):\(second)"
        }
        let newHour = Int(hour)!+12
        return "\(newHour):\(minute):\(second)"
    }

    return "Error"
}
