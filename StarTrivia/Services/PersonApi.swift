//
//  PersonApi.swift
//  StarTrivia
//
//  Created by Ahmed Sayed on 11/23/20.
//  Copyright © 2020 Ahmed Sayed. All rights reserved.
//

import Foundation

class PersonApi {
    
    func getRandomPersonUrlSession() {
    
        guard let url = URL(string: PERSON_URL) else { return }
    
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard error == nil else {
                debugPrint(error.debugDescription)
                return
            }
            
            // Unwrapping data
            guard let data = data else { return }
            
            do {
                let jsonAny = try JSONSerialization.jsonObject(with: data, options: [])
                // Casting to json dictionary "[String: Any]" Key & Value
                guard let json = jsonAny as? [String: Any] else { return }
                let person = self.parsePersonManual(json: json)
                
                print(person.name)
                print(person.height)
            } catch {
                debugPrint(error.localizedDescription)
                return
            }
            
        }
        task.resume()
    }
    
    private func parsePersonManual(json: [String: Any]) -> Person {
        let name = json["name"] as? String ?? ""            // if fails, set value to ""
        let height = json["height"] as? String ?? ""
        let mass = json["mass"] as? String ?? ""
        let hair = json["hair_color"] as? String ?? ""
        let birthYear = json["birth_year"] as? String ?? ""
        let gender = json["gender"] as? String ?? ""
        let homeworldUrl = json["homeworld"] as? String ?? ""
        let filmUrls = json["films"] as? [String] ?? [String]()
        let vehicleUrls = json["vehicles"] as? [String] ?? [String]()
        let starshipUrls = json["starships"] as? [String] ?? [String]()
        
        let person = Person(name: name, height: height, mass: mass, hair: hair, birthYear: birthYear, gender: gender, homeworldUrl: homeworldUrl, filmUrls: filmUrls, vehicleUrls: vehicleUrls, starshipUrls: starshipUrls)
        
        return person
    }
}
