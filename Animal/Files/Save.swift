//
//  Save.swift
//  Animal
//
//  Created by Luke Deerinck on 12/19/19.
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
