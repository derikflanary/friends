//
//  FriendCell.swift
//  friends
//
//  Created by Derik Flanary on 12/5/16.
//  Copyright © 2016 Derik Flanary. All rights reserved.
//

import Foundation
import UIKit

class FriendCell: UITableViewCell, ReusableView {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var recipientLabel: UILabel!
    
    func configure(with friend: Friend) {
        nameLabel.text = friend.human.rawValue
        guard let recipient = friend.recipient else { return }
        recipientLabel.text = "Giving to: \(recipient.rawValue)"
    }

}

protocol ReusableView: class {}

extension ReusableView where Self: UIView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
}

extension UITableView {
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
    
}
