//
//  CitiesResponseBuilder.swift
//  WeatherAppTests
//
//  Created by Sebastian Maludziński on 14/02/2025.
//

import Foundation

struct CitiesDataBuilder {

    static func getCitiesData() -> Data {
                    """
                    [{
                       "Version":1,
                       "Key":"274663",
                       "Type":"City",
                       "Rank":20,
                       "LocalizedName":"Warszawa",
                       "EnglishName":"Warsaw",
                       "PrimaryPostalCode":"",
                       "Region":{
                          "ID":"EUR",
                          "LocalizedName":"Europa",
                          "EnglishName":"Europe"
                       },
                       "Country":{
                          "ID":"PL",
                          "LocalizedName":"Polska",
                          "EnglishName":"Poland"
                       },
                       "AdministrativeArea":{
                          "ID":"14",
                          "LocalizedName":"Mazowieckie",
                          "EnglishName":"Masovia",
                          "Level":1,
                          "LocalizedType":"Województwo",
                          "EnglishType":"Voivodship",
                          "CountryID":"PL"
                       },
                       "TimeZone":{
                          "Code":"CET",
                          "Name":"Europe/Warsaw",
                          "GmtOffset":1.0,
                          "IsDaylightSaving":false,
                          "NextOffsetChange":"2025-03-30T01:00:00Z"
                       },
                       "GeoPosition":{
                          "Latitude":52.232,
                          "Longitude":21.007,
                          "Elevation":{
                             "Metric":{
                                "Value":112.0,
                                "Unit":"m",
                                "UnitType":5
                             },
                             "Imperial":{
                                "Value":367.0,
                                "Unit":"ft",
                                "UnitType":0
                             }
                          }
                       },
                       "IsAlias":false,
                       "SupplementalAdminAreas":[
                          {
                             "Level":2,
                             "LocalizedName":"Warszawa",
                             "EnglishName":"Warsaw"
                          },
                          {
                             "Level":3,
                             "LocalizedName":"Warszawa",
                             "EnglishName":"Warsaw"
                          }
                       ],
                       "DataSets":[
                          "AirQualityCurrentConditions",
                          "AirQualityForecasts",
                          "Alerts",
                          "DailyPollenForecast",
                          "ForecastConfidence",
                          "FutureRadar",
                          "MinuteCast",
                          "Radar"
                       ]
                    }]
                    """.data(using: .utf8)!
    }

}
