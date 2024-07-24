//
//  APIModule.swift
//  Weather
//
//  Created by Baek on 2023/12/07.
//

import Foundation

class UserLoactionAPI {
    let session = URLSession.shared
    let semaphore = DispatchSemaphore(value: 0)
    
    func dataTask(by url: String , completion: @escaping (Result<ResponseCityDataFromLocation,CustomError>) -> ()) {
        
        guard let url = URL(string: url) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                return completion(.failure(CustomError.statusCodeError))
            }
            
            if let data = data {
                do {
                    let decodeData = try JSONDecoder().decode(ResponseCityDataFromLocation.self, from: data)
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
