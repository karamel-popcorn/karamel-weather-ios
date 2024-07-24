//
//  HourlyWeatherAPI.swift
//  Weather
//
//  Created by Baek on 1/26/24.
//

import Foundation

class HourlyWeatherAPI {
    let session = URLSession.shared
    let semaphore = DispatchSemaphore(value: 0)
    
    func dataTask(by url: String , completion: @escaping (Result<HourlyWeatherData,CustomError>) -> ()) {
        
        guard let url = URL(string: url) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                return completion(.failure(CustomError.unknownError))
            }
            
            if let data = data {
                do {
                    let decodeData = try JSONDecoder().decode(HourlyWeatherData.self, from: data)
                    completion(.success(decodeData))
                }
                catch {
                    print(error.localizedDescription)
                }
            }
            self.semaphore.signal()
        }
        task.resume()
        self.semaphore.wait()
    }
}
