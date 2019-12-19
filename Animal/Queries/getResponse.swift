//
//  Queries.swift
//  Animal
//
//  Created by Luke Deerinck on 12/19/19.
//  Copyright © 2019 Luke Deerinck. All rights reserved.
//

import Foundation

func getResponse() -> String {
    while true {
        let answer = readLine() ?? ""
        if answer != "" {
            return answer.prefix(1).uppercased() + answer.lowercased().dropFirst()
        }
        print("please answer the question\n")
    }
}
