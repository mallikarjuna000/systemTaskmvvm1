//
//  Service.swift
//  systemTask1
//
//  Created by mallikarjuna Bakka on 25/12/19.
//  Copyright © 2019 mallikarjuna Bakka. All rights reserved.
//

import UIKit
//model class
class Service: NSObject {
    
    static let shareInstance = Service()
    
    func getAllMovieData(complition:@escaping([MovieModel]?,Error?) -> ()) {
        let urlString = "https://itunes.apple.com/search?media=music&term=bollywood"
        guard let url = URL(string: urlString) else {
            return
        }
        URLSession.shared.dataTask(with: url){(data,response,error) in
            if let err = error{
                complition(nil,error)
                print("Loading data error:\(err.localizedDescription)")
            }else{
                guard  let data = data else {
                    return
                }
                do{
                    var arrMovieData = [MovieModel]()
                    let results = try JSONDecoder().decode(ResultsModel.self, from: data)
                    for movie in results.results {
                        arrMovieData.append(MovieModel(artistName: movie.artistName!, releaseDate: movie.releaseDate!,artworkUrl30:movie.artworkUrl30!))
                    }
                    complition(arrMovieData,nil)
                   // print(arrMovieData)
                }catch let jsonErr{
                    print("json error : \(jsonErr.localizedDescription)")
                }
            }
        }.resume()
    }

}
