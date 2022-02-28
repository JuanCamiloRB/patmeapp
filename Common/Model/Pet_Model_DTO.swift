//
//  Pet_Model_DTO.swift
//  patmeapp
//
//  Created by Juan Camilo on 3/02/22.
//

import Foundation

struct PetModelDTO: Codable {
    var _id: String? = nil
    var name: String
    var species: String
    var picture: String? = nil
    var gender: String? = nil
    var breed: [String]? = nil
    var owner: String? = nil
    var neutered: String? = nil
    var isMixedBreed: Bool? = nil
    var birthday: String? = nil
    var isExactBirthday: Bool? = nil
    var carers: [String]? = nil
    


    func toDictionary() -> [String:Any]{
     
        var dictio: [String: Any] = ["name":name, "species":species]
        if picture != nil{
            dictio["picture"] = picture
            
        }
        if gender != nil{
            dictio["gender"] = gender
            
        }
        
        if breed != nil{
      
            dictio["breed"] = breed
            
        }
        if neutered != nil{
            dictio["neutered"] = neutered
            
        }
        if isMixedBreed != nil{
            dictio["isMixedBreed"] = isMixedBreed
            
        }
        if birthday != nil{
            dictio["birthday"] = birthday
            
        }
        if isExactBirthday != nil{
            dictio["isExactBirthday"] = isExactBirthday
            
        }
        return dictio
    }
        
        
        
        
        
}
        
      
