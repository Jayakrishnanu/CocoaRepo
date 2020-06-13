//
//  Networking.swift
//  CocoaRepo
//
//  Created by Jayakrishnan u on 6/13/20.
//

import Foundation

extension CocoaCore {
    public class Networking {
        
        /// Responsible for handalling all network calls
        /// Warning: Must create before using any Public API's
        public class Manager {
            public init() { }
            private let session = URLSession.shared
            public func loadData(from url: URL, completionHandler: @escaping(NetworkResult<Data>) -> Void) {
                let task = session.dataTask(with: url) { (data, response, error) in
                    let result = data.map(NetworkResult<Data>.success) ?? .failure(error)
                    completionHandler(result)
                }
                task.resume()
            }
        }
        
        public enum NetworkResult<Value> {
            case success(Value)
            case failure(Error?)
        }
    }
}
