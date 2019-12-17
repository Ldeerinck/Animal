//
//  Load.swift
//  Animal
//
//  Created by Luke Deerinck on 12/16/19.
//  Copyright © 2019 Luke Deerinck. All rights reserved.
//

import Foundation

func save(node: Node) {
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted

    do {
        let jsonData = try encoder.encode(node)
        let filename = getDocumentsDirectory().appendingPathComponent("Animal.txt")
        do {
            try jsonData.write(to: filename)
        } catch {
            print("Error writing file.")
        }
    } catch {
        print(error.localizedDescription)
    }
}

func load() -> Node {
    let filename = getDocumentsDirectory().appendingPathComponent("Animal.txt")
    do {
        let json = try String(contentsOf: filename, encoding: .utf8).data(using: .utf8)!
        let decoder = JSONDecoder()
        let root = try decoder.decode(Node.self, from: json)
        return root
    } catch {
        print(error.localizedDescription)
        return Node(info: "Does it fly?", yes: Node(info: "Bird", yes: nil, no: nil), no: Node(info: "Dog", yes: nil, no: nil))
    }
}

func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}
