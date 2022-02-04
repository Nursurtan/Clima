//
//  WeatherManager.swift
//  Clima
//
//  Created by нурсултан арапов on 1/28/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=08356d2f383d52f83c7298b14715249d&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        //1. Create a URL
        if let url = URL(string: urlString) {
            //2. Create a URLSession
            
            let session = URLSession(configuration: .default)
            
            //3. Give a session a task
            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            
            // 4. Start a task
            task.resume()
        }
    }
    
    
    func handle(data: Data?, response: URLResponse?, error: Error?) -> Void {
        if error != nil {
            print(error!)
            return
        }
        
        if let saveData = data {
            let dataString = String (data: saveData, encoding: .utf8)
        }
    }
}
