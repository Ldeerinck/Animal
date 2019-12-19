//
//  getYesOrNo.swift
//  Animal
//
//  Created by Luke Deerinck on 12/19/19.
//  Copyright © 2019 Luke Deerinck. All rights reserved.
//

import Foundation

func getYesOrNo() -> String {
    while true {
        let answer = readLine()?.prefix(1).uppercased() ?? ""
        if answer == "Y" || answer == "N" {
            return answer
        }
        print("please answer the question\n")
    }
}
