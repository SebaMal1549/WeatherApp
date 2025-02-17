//
//  WeatherDetailsDataBuilder.swift
//  WeatherAppTests
//
//  Created by Sebastian Maludziński on 14/02/2025.
//

import Foundation

struct WeatherDetailsDataBuilder {
    
    static func getWeatherDetailsData() -> Data {
        """
        [
           {
              "WeatherText":"Bezchmurnie",
              "HasPrecipitation":false,
              "PrecipitationType":null,
              "Temperature":{
                 "Metric":{
                    "Value":0.0,
                    "Unit":"C",
                    "UnitType":17
                 },
                 "Imperial":{
                    "Value":32.0,
                    "Unit":"F",
                    "UnitType":18
                 }
              },
              "RealFeelTemperature":{
                 "Metric":{
                    "Value":-2.4,
                    "Unit":"C",
                    "UnitType":17,
                    "Phrase":"Zimno"
                 },
                 "Imperial":{
                    "Value":28.0,
                    "Unit":"F",
                    "UnitType":18,
                    "Phrase":"Zimno"
                 }
              },
              "RelativeHumidity":87,
              "Wind":{
                 "Direction":{
                    "Degrees":68,
                    "Localized":"ENE",
                    "English":"ENE"
                 },
                 "Speed":{
                    "Metric":{
                       "Value":10.2,
                       "Unit":"km/h",
                       "UnitType":7
                    },
                    "Imperial":{
                       "Value":6.4,
                       "Unit":"mi/h",
                       "UnitType":9
                    }
                 }
              },
              "Visibility":{
                 "Metric":{
                    "Value":24.1,
                    "Unit":"km",
                    "UnitType":6
                 },
                 "Imperial":{
                    "Value":15.0,
                    "Unit":"mi",
                    "UnitType":2
                 }
              },
              "Pressure":{
                 "Metric":{
                    "Value":1019.0,
                    "Unit":"mb",
                    "UnitType":14
                 },
                 "Imperial":{
                    "Value":30.09,
                    "Unit":"inHg",
                    "UnitType":12
                 }
              }
           }
        ]
        """.data(using: .utf8)!
    }
    
}
