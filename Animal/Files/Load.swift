//
//  Load.swift
//  Animal
//
//  Created by Luke Deerinck on 12/16/19.
//  Copyright © 2019 Luke Deerinck. All rights reserved.
//

import Foundation

func load() -> Node {
    let filename = getDocumentsDirectory().appendingPathComponent("Animal.txt")
    do {
        let json = try String(contentsOf: filename, encoding: .utf8).data(using: .utf8)!
        let decoder = JSONDecoder()
        let root = try decoder.decode(Node.self, from: json)
        return root
    } catch {
        print(error.localizedDescription)
        return Node(question: "Does it fly?", yes: Node(name: "Bird"), no: Node(name: "Dog"))
    }
}

