//
//  Queries.swift
//  Animal
//
//  Created by Luke Deerinck on 12/19/19.
//  Copyright © 2019 Luke Deerinck. All rights reserved.
//

import Foundation

func getResponse() -> String {
    var answer = readLine() ?? ""
    while answer == ""{
        print("please answer the question\n")
        answer = readLine() ?? ""
    }
    answer = answer.prefix(1).uppercased() + answer.lowercased().dropFirst()
    return answer
}
func getYesOrNo() -> String {
    var answer = readLine() ?? ""
    while ((answer.prefix(1) != "Y") || (answer.prefix(1) != "N")) {
        print("please answer the question\n")
        answer = readLine() ?? ""
    }
    answer = answer.prefix(1).uppercased()
    return answer
}
