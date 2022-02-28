//
//  Resources_Model.swift
//  patmeapp
//
//  Created by Juan Camilo on 30/12/21.
//

import Foundation


struct Request_data: Codable {
    let id: String
    let name: String
    let values: [Resource]
    let language: String
    var selected = false
    private enum CodingKeys: String, CodingKey {
            case id = "_id"
            case name = "name"
            case values = "values"
            case language = "language"
        }
    init(id: String, name: String, values: [Resource], language: String){
        self.id = id
        self.name = name
        self.values = values
        self.language = language
    }
}
struct Resource: Codable {
    let value: String
    let label: String
    var selected = false
    private enum CodingKeys: String, CodingKey {
            case value = "value"
            case label = "label"
        }
    init(value: String, label: String){
        self.value = value
        self.label = label
    }
}
struct BreedModel: Codable {
    let value: String
    let label: String
    var isnew: Bool
    private enum CodingKeys: String, CodingKey {
            case value = "value"
            case label = "label"
            case isnew = "isnew"
        }
    init(value: String, label: String, isnew: Bool = false){
        self.value = value
        self.label = label
        self.isnew = isnew
    }
}
