//
//  ClothesStyle.swift
//  snap-style
//
//  Created by dary winata nugraha djati on 27/06/23.
//

import Foundation

struct ClothesStyle: Identifiable, Codable, Hashable {
    var id: UUID
    var bodyShape: [BodyShape]
    var name: String
    var description: String?
    var gender: Gender
    var colors: [String]
    var occation: [String]
    var type: String
    var image: String
    var isFavorite: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, bodyShape, name, description, gender, colors, occation, type, image, isFavorite
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = UUID()
        bodyShape = try container.decode([BodyShape].self, forKey: .bodyShape)
        name = try container.decode(String.self, forKey: .name)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        gender = try container.decode(Gender.self, forKey: .gender)
        colors = try container.decode([String].self, forKey: .colors)
        occation = try container.decode([String].self, forKey: .occation)
        type = try container.decode(String.self, forKey: .type)
        image = try container.decode(String.self, forKey: .image)
        isFavorite = try container.decode(Bool.self, forKey: .isFavorite)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        // Combine other properties that contribute to the hash value
    }
    
    static func == (lhs: ClothesStyle, rhs: ClothesStyle) -> Bool {
        // Implement your equality logic based on the properties that define equality
        return lhs.id == rhs.id
    }
}
