//
//  main.swift
//  Animal
//
//  Created by Luke Deerinck on 12/16/19.
//  Copyright © 2019 Luke Deerinck. All rights reserved.
//

import Foundation
var root = load()
var currentNode = root;
var previousNode = root;
func main(){
     var response = "Y"
    while (response.prefix(1) == "Y") {
        playARound(root: root)
        print("Would you like to Play Again?")
        response = getResponse()
        save(node: root)
        root = load()
    }
        
    }

func playARound(root: Node){
    currentNode = root
    while (currentNode.yesChild != nil) && (currentNode.noChild != nil){
        print(currentNode.data)
        var answer = getResponse()
        if answer.prefix(1) == "Y" {
            previousNode = currentNode
            currentNode = currentNode.yesChild!
            if (currentNode.noChild == nil) && (currentNode.yesChild == nil) {
                print("is it a",currentNode.data,"?")
                answer = getResponse()
                if answer.prefix(1) == "Y" {
                     print("I win")
                     break
                }
                else {
                     print("I lose")
                    previousNode.yesChild = buildNewNode(currentAnswer: currentNode)
                    break
                }
            }
        }
        else if answer.prefix(1) == "N" {
                previousNode = currentNode
                currentNode = currentNode.noChild!
                if (currentNode.noChild == nil) && (currentNode.yesChild == nil) {
                    print("is it a",currentNode.data,"?")
                    answer = getResponse()
                    if answer.prefix(1) == "Y" {
                         print("I win")
                         break
                    }
                    else {
                        print("I lose")
                        previousNode.noChild = buildNewNode(currentAnswer: currentNode)
                         break
                    }
                }
        }
    }
}

func getResponse() -> String {
    var answer = readLine() ?? ""
    while answer == ""{
        print("please answer the question\n")
        answer = readLine() ?? ""
    }
    answer = answer.prefix(1).uppercased() + answer.lowercased().dropFirst()
    return answer
}

func buildNewNode(currentAnswer: Node) -> Node {
    print("What is your animal?")
    let animal = getResponse()
    let animalNode = Node(info: animal, yes: nil, no: nil)
    print("What is question that distinguishes your animal from a",currentNode.data,"?")
    let question = getResponse()
    print("Is the answer yes or no for your animal?")
    let reply = getResponse()
    if reply.prefix(1) == "Y" {
        return Node(info: question, yes: animalNode, no: currentAnswer)
    }
    else {
        return Node(info: question, yes: currentAnswer, no: animalNode)
    }
}


main()
