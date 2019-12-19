//
//  main.swift
//  Animal
//
//  Created by Luke Deerinck on 12/16/19.
//  Copyright © 2019 Luke Deerinck. All rights reserved.
//

import Foundation
func main(){
    while (true) {
        var root = load()
        root.ask()
        print("Do you want to save the current tree?")
        var response = getYesOrNo()
        if response == "Y" {
            save(node: root)
            root = load()
        }
        print("Would you like to Play Again?")
        response = getYesOrNo()
        if (response.prefix(1) == "N") {
            break
        }
    }
        
}


main()
