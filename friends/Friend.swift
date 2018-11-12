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
    case sam
    case rob
    case jesse
    case carly

    var lover: Human? {
        switch self {
        case .derik:
            return .kandace
        case .kandace:
            return .derik
        case .sam:
            return nil
        case .rob:
            return nil
        case .jesse:
            return .carly
        case .carly:
            return .jesse
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
