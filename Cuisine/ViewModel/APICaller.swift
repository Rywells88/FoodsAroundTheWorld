//
//  APICaller.swift
//  Cuisine
//
//  Created by Ryley Wells on 2022-03-29.
//

import Foundation

public class APICaller {
    
    public static let shared = APICaller()
    
    public init(){}
    
    public func fetchWikiAPI(completion: @escaping ([String])-> Void, searchTerm : String){
        
        
        guard let url = URL(string: "https://en.wikipedia.org/w/api.php?action=query&format=json&prop=extracts&meta=&continue=&titles=\(searchTerm)&exsentences=4&exintro=1&explaintext=1")else{
            print("didn't work URL")
            completion([])
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){data, _, error in
            guard let data = data, error == nil else{
                print("didn't work shared")
                completion([])
                return
            }
        
            var result : ResultItem?
            
            do{
                let json = try Data(contentsOf: url)
                result = try JSONDecoder().decode(ResultItem.self, from: json)
                
                var res = result!.query.pages
                
                for (number, detail) in res{
                    print("\(detail.extract)")
                    completion([detail.extract])
                }
    
            }catch{
                print("Error: \(error)")
                completion([])
            }
                
                
             
            
            
        }
        task.resume()

    }
    
}

struct ResultItem : Codable{
    let query : PageItem
}
struct PageItem : Codable{
    let pages : [Int : Detail]
}
struct Detail :Codable{
    let pageid : Int
    let ns : Int
    let title : String
    let extract : String
}
/*
You use a completion handler in a function when you know that function will take a while to complete. You don't know how long, and you don't want to pause your life waiting for it to finish.
*/

