//
//  QuestionTree.swift
//  Animal
//
//  Created by Luke Deerinck on 12/16/19.
//  Copyright © 2019 Luke Deerinck. All rights reserved.
//

import Foundation

class Node: Codable{
    var data:String
    var yesChild:Node?
    var noChild:Node?
    
    init(info: String, yes: Node?, no: Node?) {
        data = info
        self.yesChild = yes
        self.noChild = no
    }
    
}

