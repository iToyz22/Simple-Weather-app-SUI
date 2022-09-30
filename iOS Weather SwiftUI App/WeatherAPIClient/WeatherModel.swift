//
//  WeatherModel.swift
//  iOS Weather SwiftUI App
//
//  Created by Anatoliy on 29.09.2022.
//

import Foundation
import SwiftUI

struct WeatherModel: Codable {
    let data: WeatherData
}

struct WeatherData: Codable {
    let timelines: [WeatherTimelines]
}

struct WeatherTimelines: Codable {
    let intervals: [WeatherIntervals]
}

struct WeatherIntervals: Codable {
    let startTime: String
    let values: WeatherValue
}

struct WeatherValue: Codable {
    var temperature: Double
    var weatherCode: Int
}

enum WeatherCode: String, Codable {
    case clear = "1000"
    case mostlyClear = "1100"
    case partlyCloudy = "1101"
    case mostlyCloudy = "1102"
    case cloudy = "1001"
    case fog = "2000"
    case lightFog = "2100"
    case lightWind = "3000"
    case wind = "3001"
    case strongWind = "3002"
    case drizzle = "4000"
    case rain = "4001"
    case lightRain = "4200"
    case heavyRain = "4201"
    case snow = "5000"
    case flurries = "5001"
    case lightSnow = "5100"
    case heavySnow = "5101"
    case freezingDrizzle = "6000"
    case freezingRain = "6001"
    case lightFreezingRain = "6200"
    case heavyFreezingRain = "6201"
    case icePellets = "7000"
    case heavyIcePellets = "7101"
    case lightIcePellets = "7102"
    case thunderstorm = "8000"
    
    var description: String {
        switch self {
        case .clear:
            return "Очень солнечно!\n Не забудьте ваш головной убор!"
        case .cloudy, .mostlyCloudy:
            return "Сегодня облачно!\n Остерегайтесь дождя"
        case .mostlyClear, .partlyCloudy:
            return "Хорошего вам дня!"
        case .fog, .lightFog:
            return "Водите безопасно и обязательно включите ближний свет фар!"
        case .lightWind:
            return "Наслаждайтесь легким ветерком сегодня!"
        case .wind, .strongWind:
            return "Сегодня очень ветрено!"
        case .drizzle, .lightRain:
            return "Небольшой дождь,\n не забудьте зонт!"
        case .rain, .heavyRain:
            return "Небольшой дождь,\n не забудьте зонт!"
        case .snow, .flurries, .lightSnow, .heavySnow:
            return "Какой прекрасный день!\n Не забудьте варежки!"
        case .freezingDrizzle:
            return "Так холодно бррр! Держите тепло!"
        case .freezingRain, .lightFreezingRain, .heavyFreezingRain:
            return "Езжайте осторожно, дороги могут быть скользкими!"
        case .icePellets:
            return "Ледяная крупа"
        case .heavyIcePellets:
            return "Укрыться!\n Опасность сильного града!"
        case .lightIcePellets:
            return "Легкий град!"
        case .thunderstorm:
            return "Старайтесь оставаться внутри!\n Предупреждение о грозе!"
        }
    }
    
    var image: Image {
        switch self {
        case .clear:
            return Image(systemName: "sun.max.fill")
        case .cloudy:
            return Image(systemName: "cloud.fill")
        case .mostlyClear, .partlyCloudy, .mostlyCloudy:
            return Image(systemName: "cloud.sun.fill")
        case .fog, .lightFog:
            return Image(systemName: "cloud.fog.fill")
        case .lightWind, .wind:
            return Image(systemName: "wind")
        case .strongWind:
            return Image(systemName: "tornado")
        case .drizzle:
            return Image(systemName: "cloud.drizzle.fill")
        case .lightRain, .rain:
            return Image(systemName: "cloud.rain.fill")
        case .heavyRain:
            return Image(systemName: "cloud.heavyrain.fill")
        case .snow, .flurries, .lightSnow, .heavySnow:
            return Image(systemName: "snow")
        case .freezingDrizzle:
            return Image(systemName: "thermometer.snowflake")
        case .freezingRain, .lightFreezingRain, .heavyFreezingRain:
            return Image(systemName: "cloud.rain.fill")
        case .icePellets, .heavyIcePellets, .lightIcePellets:
            return Image(systemName: "cloud.hail.fill")
        case .thunderstorm:
            return Image(systemName: "cloud.bolt.fill")
        }
    }
}
struct Weather: Identifiable {
    let id = UUID()
    
    let temperature: Int
    let weatherCode: WeatherCode
}
