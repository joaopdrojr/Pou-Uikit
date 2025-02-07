//
//  PetModel.swift
//  pouUIKit
//
//  Created by Joao Pedro Junior on 07/02/25.
//

import Foundation

class Pet {
    var name: String
    var hunger: Int
    var happiness: Int
    var energy: Int

    init(name: String, hunger: Int = 50, happiness: Int = 50, energy: Int = 50) {
        self.name = name
        self.hunger = hunger
        self.happiness = happiness
        self.energy = energy
    }

    func feed() {
        hunger = max(hunger - 10, 0)
        energy = min(energy + 5, 100)
    }

    func play() {
        happiness = min(happiness + 10, 100)
        hunger = min(hunger + 5, 100)
    }

    func sleep() {
        energy = min(energy + 20, 100)
    }
}
