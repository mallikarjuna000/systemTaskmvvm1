//
//  MovieModel.swift
//  systemTask1
//
//  Created by mallikarjuna Bakka on 25/12/19.
//  Copyright © 2019 mallikarjuna Bakka. All rights reserved.
//

import UIKit

class MovieModel: Decodable {
    var artistName:String?
    var releaseDate:String?
    var artworkUrl30:String?
    init(artistName:String,releaseDate:String,artworkUrl30:String){
        self.artistName = artistName
        self.releaseDate = releaseDate
        self.artworkUrl30 = artworkUrl30
    }
    
}

class ResultsModel: Decodable{
    var results = [MovieModel]()
    init(results: [MovieModel]) {
        self.results = results
    }
}
