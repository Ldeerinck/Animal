//
//  Node.swift
//  Animal
//
//  Created by Luke Deerinck on 12/19/19.
//  Copyright © 2019 Luke Deerinck. All rights reserved.
//

import Foundation

class Node: Codable{
    private enum NodeType: String, Codable {
        case question
        case answer
        
    }
    private var type:NodeType
    private var data:String
    private var yesChild:Node?
    private var noChild:Node?
    
    init(name: String) {
        data = name
        type = .answer
    }
    init(question: String, yes: Node, no: Node){
        data = question
        type = .question
        yesChild = yes
        noChild = no
        
    }
    
    func buildNewNode(currentAnswer: Node){
        print("What is your animal?")
        let animal = getResponse()
        let animalNode = Node(name: animal)
        print("What is question that distinguishes your animal from a",self.data,"?")
        let question = getResponse()
        print("Is the answer yes or no for your animal?")
        let reply = getYesOrNo()
        if reply == "Y" {
            self.type = .question
            self.yesChild = animalNode
            self.noChild = Node(name: self.data)
            self.data = question
            
        }
        else {
            self.type = .question
            self.yesChild = Node(name: self.data)
            self.noChild = animalNode
            self.data = question
        }
    }
    

    func ask() {

        switch self.type {
        case .question:
              print(self.data)
              let answer = getYesOrNo()
              if answer == "Y" {
                self.yesChild!.ask()
              } else {
                self.noChild!.ask()
            }
        case .answer:
            print("is it a",self.data,"?")
            let answer = getYesOrNo()
            if answer == "Y" {
                print("I win")
              } else {
                print("I lose")
                buildNewNode(currentAnswer: self)
            }
        }
    }
}

