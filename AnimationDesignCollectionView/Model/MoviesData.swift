//
//  MoviesData.swift
//  AnimationDesignCollectionView
//
//  Created by iPHTech 29 on 28/04/23.
//

import Foundation

struct Movies {
    
    let movieName: String
    let rating: String
    let moviesImage: String
    let moviesType: String
    let duration: String

    static func defaultMoviesList() -> [Movies] {
        
        var moviesList = [Movies]()
        moviesList.append(Movies(movieName: "Adipurush", rating: "4.5", moviesImage: "adipurush", moviesType: "Action, Crime, Comedy", duration: "India, 2023 / 2h 10min / PG-16"))
        moviesList.append(Movies(movieName: "Article-15", rating: "4.5", moviesImage: "article-15", moviesType: "Action, Crime, Comedy", duration: "India, 2019 / 2h 10min / PG-16"))
        moviesList.append(Movies(movieName: "Kisi Ka Bhai Kisi Ki Jaan ", rating: "4.5", moviesImage: "bhaijaan", moviesType: "Action, Crime, Comedy", duration: "India, 2019 / 2h 10min / PG-16"))
        moviesList.append(Movies(movieName: "Bhola", rating: "4.5", moviesImage: "bhola", moviesType: "Action, Crime, Comedy", duration: "India, 2023 / 2h 10min / PG-16"))
        moviesList.append(Movies(movieName: "Brahmastra", rating: "4.5", moviesImage: "brahmastra", moviesType: "Action, Crime, Comedy", duration: "India, 2022 / 2h 10min / PG-16"))
        moviesList.append(Movies(movieName: "Chennai Express", rating: "4.5", moviesImage: "chennaiExpress", moviesType: "Action, Crime, Comedy", duration: "India, 2012 / 2h 10min / PG-16"))
        moviesList.append(Movies(movieName: "Jawan", rating: "4.5", moviesImage: "jawan", moviesType: "Action, Crime, Comedy", duration: "India, 2023 / 2h 10min / PG-16"))
        moviesList.append(Movies(movieName: "The Little Mermaid", rating: "4.5", moviesImage: "mermaid", moviesType: "Action, Crime, Comedy", duration: "USA, 2019 / 2h 10min / PG-16"))
        moviesList.append(Movies(movieName: "Shazam! Fury of the Gods", rating: "4.5", moviesImage: "shazam", moviesType: "Action, Crime, Comedy", duration: "USA, 2019 / 2h 10min / PG-16"))
        moviesList.append(Movies(movieName: " John Wick: Chapter 4", rating: "4.5", moviesImage: "jhon", moviesType: "Action, Crime, Comedy", duration: "USA, 2019 / 2h 10min / PG-16"))
        moviesList.append(Movies(movieName: "Avatar: The Way of Water", rating: "4.5", moviesImage: "avatar", moviesType: "Action, Crime, Comedy", duration: "USA, 2019 / 2h 10min / PG-16"))
        moviesList.append(Movies(movieName: "The Little Mermaid", rating: "4.5", moviesImage: "mermaid", moviesType: "Action, Crime, Comedy", duration: "USA, 2019 / 2h 10min / PG-16"))
     
        return moviesList
    }
}
