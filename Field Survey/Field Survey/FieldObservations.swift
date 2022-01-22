//
//  FieldObservations.swift
//  Field Survey
//
//  Created by Jack Riebel on 11/19/21.
//

import Foundation

import Foundation

enum ObservationType: String, Codable {
    case bird
    case amphibian
    case reptile
    case insect
    case fish
    case plant
    case mammal
}

struct Observations: Codable {
    var classification: ObservationType
    var title: String
    var description: String
    var date: Date
}

struct FieldObservations: Codable {
    var status: String
    var observations: [Observations]
}
