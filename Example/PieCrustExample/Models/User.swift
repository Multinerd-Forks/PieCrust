//
//  User.swift
//  PieCrustExample
//
//  Created by Omar Albeik on 21.02.2018.
//  Copyright © 2018 Mobilion. All rights reserved.
//

import UIKit

struct User {

    var name: String
    var email: String?
    var photo: UIImage?
    
}

// MARK: - Users
extension User {

    static var steveJobs: User {
        return User(name: "Steve Jobs", email: "steve@apple.com", photo: #imageLiteral(resourceName: "steve"))
    }

}
