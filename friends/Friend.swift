//
//  Friend.swift
//  friends
//
//  Created by Derik Flanary on 12/5/16.
//  Copyright © 2016 Derik Flanary. All rights reserved.
//

import Foundation
import UIKit

enum Human: String, CaseIterable {
    case derik
    case kandace
    case rob
    case jesse
    case carly
    case parker
    case danny
    case emily
    case blake
    case claire
    case autumn
    case max
    case mal
    case samAndJo = "Sam and Jo"
    case tylerAndAllae = "Tyler and Allae"
    case karleyAndJames = "Karley and James"
    case dannyAndLenny = "Danny and Lenny"


    var lover: Human? {
        switch self {
        case .derik:
            return .kandace
        case .kandace:
            return .derik
        case .jesse:
            return .carly
        case .carly:
            return .jesse
        case .emily:
            return .blake
        case .blake:
            return .emily
        case .parker, .danny, .autumn, .mal, .max, .claire, .rob, .tylerAndAllae, .dannyAndLenny, .samAndJo, .karleyAndJames:
            return nil
        }
    }
    
}

struct Friend {

    let human: Human
    var recipient: Human?

    init(human: Human) {
        self.human = human
    }

}

extension Friend: Equatable { }

func ==(lhs: Friend, rhs: Friend) -> Bool {
    return lhs.human == rhs.human
}
