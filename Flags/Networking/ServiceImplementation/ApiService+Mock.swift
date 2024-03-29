//
//  ApiService+Mock.swift
//  Flags
//
//  Created by Marcello on 17/10/22.
//

import Foundation

/// Mock implementation of ApiSerivice
class MockApiService: ApiService{
    func getCountries(result: @escaping (Result<[Country], ApiServiceError>) -> Void) {
        let flag = Flag(png: "https://restcountries.com/data/png/ita.png", svg: "https://restcountries.com/data/svg/ita.png")
        let country1 = Country(cca2: "IT", cca3: "ITA", name: CountryName(common: "Italy", official: "Italy Republic"),
                               region: "Europe", subregion: "South-Europe", flags: flag, flag: "🇮🇹", population: 65000000)
        
        let countries: [Country] = [country1]
        return result(.success(countries))
    }
    
    
    var configuration: ApiConfiguration
    
    init(configuration: ApiConfiguration){
        self.configuration = configuration
    }
    
}
