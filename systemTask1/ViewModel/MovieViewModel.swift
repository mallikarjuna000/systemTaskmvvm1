//
//  MovieViewModel.swift
//  systemTask1
//
//  Created by mallikarjuna Bakka on 25/12/19.
//  Copyright © 2019 mallikarjuna Bakka. All rights reserved.
//

import UIKit

class MovieViewModel: NSObject {
    var artistName:String?
    var releaseDate:String?
    var artworkUrl30:String?
    init(movie:MovieModel){
        self.artistName = movie.artistName
        self.releaseDate = movie.releaseDate
        self.artworkUrl30 = movie.artworkUrl30
    }
}
