//
//  Networking.swift
//  CocoaRepo
//
//  Created by Jayakrishnan u on 6/13/20.
//

import Foundation

protocol NetworkSession {
    func get(from url: URL, completionHandler: @escaping(Data?, Error?) -> Void)
    func post(with request: URLRequest, completionHandler: @escaping(Data?, Error?) -> Void)
}

extension CocoaCore {
    public class Networking {
        
        /// Responsible for handalling all network calls
        /// Warning: Must create before using any Public API's
        public class Manager {
            public init() { }
            internal var session: NetworkSession = URLSession.shared
            
            public func loadData(from url: URL, completionHandler: @escaping(NetworkResult<Data>) -> Void) {
                session.get(from: url){ (data, error) in
                    let result = data.map(NetworkResult<Data>.success) ?? .failure(error)
                    completionHandler(result)
                }
              }
            
            public func sendData<I: Codable>(to url: URL, body: I, compeltionHandler: @escaping(NetworkResult<Data>) -> Void) {
                var request = URLRequest(url: url)
                do {
                    let httpBody = try JSONEncoder().encode(body)
                    request.httpBody = httpBody
                    request.httpMethod = "POST"
                    session.post(with: request) { (data, error) in
                        let result = data.map(NetworkResult<Data>.success) ?? .failure(error)
                        compeltionHandler(result)
                    }
                }
                catch(let error) {
                    return compeltionHandler(.failure(error))
                }
            }
        }
        
        public enum NetworkResult<Value> {
            case success(Value)
            case failure(Error?)
        }
    }
}

extension URLSession: NetworkSession {
    func post(with request: URLRequest, completionHandler: @escaping (Data?, Error?) -> Void) {
        let task = dataTask(with: request) { data, _, error in
            completionHandler(data, error)
        }
        task.resume()
    }
    

    public func get(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void) {
        let task = dataTask(with: url) { data, _, error in
            completionHandler(data, error)
        }
        task.resume()
    }
    
    
    
    
}
