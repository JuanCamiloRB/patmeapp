//
//  PetServiceBreed.swift
//  patmeapp
//
//  Created by Juan Camilo on 20/01/22.
//

import Foundation


class ResourceServiceBreed{

    private static var url =  NSLocalizedString("language_services", comment: "")
    private static var pet = [Resource_breed]()
    
   static func GetPetBreed(completion: @escaping ([Resource_breed]) -> Void){
        
        var request = URLRequest(url: URL(string: url)!)
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
                    let fetchedData = try decoder.decode(Request_data_breed.self, from: data!)
                    completion(fetchedData.values)

                }
                catch{
                    print("Error")
                    
                }
            }
        }
        task.resume()
    }
        
        
        
       // heighTable.constant = CGFloat(pets.count * 60)
    
    
}
