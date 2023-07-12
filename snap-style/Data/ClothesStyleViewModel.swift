//
//  ClothesStyleViewModel.swift
//  snap-style
//
//  Created by David Mahbubi on 11/07/23.
//

import Foundation

//class ClothesStyleViewModel {
//    func saveFavorite(clothesStyle: ClothesStyle) throws {
//        do {
//            let jsonData: Data? = encode(model: clothesStyle)
//            let jsonObject = try JSONSerialization.jsonObject(with: jsonData!, options: [])
//            if var jsonDictionary = jsonObject as? [String: any] {
//                jsonDictionary["isFavorite"] = true
//                let modifiedData = try JSONSerialization.data(withJSONObject: jsonDictionary, options: .prettyPrinted)
//            }
//        } catch {
//            
//        }
//    }
//    
//    private func encode<T: Codable> (model: T) -> Data? {
//        let encoder = JSONEncoder()
//        encoder.outputFormatting = .prettyPrinted
//        do {
//            let jsonData = try encoder.encode(model)
//            return jsonData
//        } catch {
//            print(error)
//            return nil
//        }
//    }
//}
