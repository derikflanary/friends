//
//  FriendService.swift
//  friends
//
//  Created by Derik Flanary on 12/5/16.
//  Copyright © 2016 Derik Flanary. All rights reserved.
//

import Foundation

enum FriendError: Error {
    case generatorFailed
}

struct FriendsService {
    
    var friends = [Friend]()
    
    init() {
        friends = Human.allCases.map( { Friend(human: $0) } )
    }

    mutating func assignRecipentsToFriends() throws {
        var recipients = friends
        for (index, friend) in friends.enumerated() {
            var recipentFound = false
            repeat {

                let randomNumber = Int(arc4random_uniform(UInt32(recipients.count)))
                let selectedFriend = recipients[randomNumber]
                if selectedFriend != friend && selectedFriend.human.lover != friend.human {
                    recipentFound = true
                    friends[index].recipient = selectedFriend.human
                    recipients.remove(at: randomNumber)
                } else if selectedFriend == friend && recipients.count == 1 {
                    print("error")
                    throw FriendError.generatorFailed
                }
            } while !recipentFound
        }
    }
    
}
