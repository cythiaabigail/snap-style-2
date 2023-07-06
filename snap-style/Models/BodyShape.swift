//
//  BodyShape.swift
//  snap-style
//
//  Created by dary winata nugraha djati on 27/06/23.
//

import Foundation

struct BodyShape: Codable {
    var id: UUID
    var name: String
    var description: String
    var image: String
    var gender: Gender
    
    enum CodingKeys: String, CodingKey {
        case id, name, description, image, gender
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = UUID()
        name = try container.decode(String.self, forKey: .name)
        description = try container.decode(String.self, forKey: .description)
        image = try container.decode(String.self, forKey: .image)
        gender = try container.decode(Gender.self, forKey: .gender)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(description, forKey: .description)
        try container.encode(image, forKey: .image)
        try container.encode(gender, forKey: .gender)
    }
}
