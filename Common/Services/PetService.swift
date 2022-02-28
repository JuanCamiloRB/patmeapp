//
//  PetService.swift
//  patmeapp
//
//  Created by Juan Camilo on 3/01/22.
//

import Foundation
class ResourceService{

    private static var url =  NSLocalizedString("url_backend", comment: "")
    
    private static var pet = [Resource]()
    
    static func GetPetSpecie(completion: @escaping ([Resource]) -> Void){
        
        var request = URLRequest(url: URL(string: url + "resources/species/" + NSLocalizedString("language", comment: ""))!)
        request.httpMethod = "GET"
        let decoder = JSONDecoder()
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        pet = []
        
        let task = session.dataTask(with: request){ [self](data, response, error) in
            if (error != nil ) {
                print(error)
            }
            else{
                do {
                    let fetchedData = try decoder.decode(Request_data.self, from: data!)
                    completion(fetchedData.values)

                }
                catch{
                    print("Error")
                    
                }
            }
        }
        task.resume()
    }
    static func GetPetBreed(specie:MainSpeciesEnum, completion: @escaping ([Resource]) -> Void){
        var breedRoute = ""
        
        switch specie {
            
        case MainSpeciesEnum.dog:
            breedRoute = "dog_breeds"
            print("is a bird")
        case MainSpeciesEnum.cat:
             breedRoute = "cat_breeds"
            print("is a bird")
        case MainSpeciesEnum.horse:
            breedRoute = "horse_breeds"
            print("is a bird")
            
        case MainSpeciesEnum.rabbit:
            breedRoute = "rabbit_breeds"
            print("is a  horse")
            
        case MainSpeciesEnum.bird:
            breedRoute = "bird_breeds"
            print("is a rabbit")

        default:
            print("error Specie")
        }
         var request = URLRequest(url: URL(string: url + "resources/" + breedRoute + "/" +  NSLocalizedString("language", comment: ""))!)
         request.httpMethod = "GET"
         let decoder = JSONDecoder()
         let configuration = URLSessionConfiguration.default
         let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
         pet = []
         
         let task = session.dataTask(with: request){ [self](data, response, error) in
             if (error != nil ) {
                 print(error)
             }
             else{
                 do {
                     let fetchedData = try decoder.decode(Request_data.self, from: data!)
                     completion(fetchedData.values)

                 }
                 catch{
                     print("Error")
                     
                 }
             }
         }
         task.resume()
     }
        
    static func savePet(petModel:PetModel,  completion: @escaping (PetModelDTO) -> Void){
        var url_pets = URL(string: url + "pets/")
        var request = URLRequest(url: url_pets!)
        request.httpMethod = "POST"
        let decoder = JSONDecoder()
        let token = UserDefaultUtils.getToken()
        request.setValue("Bearer " + token , forHTTPHeaderField: "Authorization")
//        let encodedData = (try? JSONEncoder().encode(petModel.toDTO()))!
//        let jsonString = String(data: encodedData, encoding: .utf8)!.replacingOccurrences(of: "Optional", with: "Small")
//        request.httpBody = try? JSONEncoder().encode(jsonString)
//        print("body")
//        print(jsonString)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body = petModel.toDTO().toDictionary()
        let bodyData = try? JSONSerialization.data(
            withJSONObject: body,
            options: [])// Change the URLRequest to a POST reques
        
        print(String(data: bodyData!, encoding: .utf8))
        print("bodyData")
       request.httpBody = bodyData
     
        dump(request)
        let task = URLSession.shared.dataTask(with: request){ [self](data, response, error) in
            if (error != nil ) {
                print(error)
            }
            else{
                do {
                    print("imprimir data")
                    print(String(data: data!, encoding: .utf8))
                    let fetchedData = try decoder.decode(PetModelDTO.self, from: data!)
                    
                    completion(fetchedData)
                    

                }
                catch{
                    print("Error")
                    
                }
            }
            print(response)
            print(petModel.toDTO())
            
        }
        task.resume()
        
    }
    
}
