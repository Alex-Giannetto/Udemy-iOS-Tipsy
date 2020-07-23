//
//  TipsBrain.swift
//  Tipsy
//
//  Created by Alex on 23/07/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct TipsBrain {
    static func calculTips(_ tips: Tips) -> Float {
        return (tips.price * (1 + tips.pourcent!.rawValue)) / Float(tips.peopleNumber)
    }
}
