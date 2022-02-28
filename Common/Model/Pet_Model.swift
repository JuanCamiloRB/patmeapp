//
//  Pet_Model.swift
//  patmeapp
//
//  Created by Juan Camilo on 1/02/22.
//

import Foundation

struct PetModel: Codable {
    var name: String
    var specie: MainSpeciesEnum
    var picture: String? = nil
    var gender: GenderEnum? = nil
    var breeds: [BreedModel]? = nil
    var owner: String? = nil
    var neutered: Bool? = nil
    var mixedBreed: Bool? = nil
    var customSpecie: Resource? = nil
    var birthday:Date?
    var isExactBirthday: Bool? = nil
    func toDTO() -> PetModelDTO{
    
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
       

        var specieValue: String = specie == MainSpeciesEnum.other ? customSpecie?.value ?? "": specie.rawValue
        var dto: PetModelDTO = PetModelDTO(name: name, species: specie.rawValue)
        dto.owner = "1"
        if picture != nil{
            dto.picture = picture
            
        }
        if gender != nil{
            dto.gender = gender?.rawValue
            
        }
        
        if breeds != nil{
            var breedsString: [String]
            breedsString = []
            for i in breeds!{
                breedsString.append(i.value)
                
            }
            dto.breed = breedsString
            
        }
        if neutered != nil{
            dto.neutered = neutered! ? "true" : "false"
            
        }
        if mixedBreed != nil{
            dto.isMixedBreed = mixedBreed
            
        }
        if birthday != nil{
            
            dto.birthday =  dateFormatter.string(from: birthday!)
            
        }
        if isExactBirthday != nil{
            dto.isExactBirthday = isExactBirthday
            
        }
        return dto
    }
}

