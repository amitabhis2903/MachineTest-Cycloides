//
//  Service.swift
//  Machine_Test
//
//  Created by Amitabh Pandey on 22/05/20.
//  Copyright © 2020 AmitabhPandey. All rights reserved.
//

import Foundation
import SystemConfiguration

//@Catch service error
enum ServiceError: Error {
    case noInternetConnection
    case custom(String)
    case other
}


extension ServiceError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .noInternetConnection:
            return "No Internet connection"
        case .other:
            return "Something went wrong"
        case .custom(let message):
            return message
        }
    }
}



class Service: NSObject {
    
    static let shared = Service()
    
    private override init() {
    }
    
    //Get Recipes From intenet.
    func getFeed(urlString: String, completion: @escaping (([Row]?), ServiceError?) -> ()) {
        
        if !MIReachability.isConnectedToNetwork() {
            completion(nil, ServiceError.noInternetConnection)
            return
        } else {
            guard let url = URL(string: urlString) else {
                completion(nil, ServiceError.custom("Bad Url"))
                return
            }
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                if let error = error {
                    print("Bad Url: \(error.localizedDescription)")
                }
                
                
                guard let data = data else {
                    completion(nil, .custom("Bad data"))
                    return
                }
                
                do {
                    let jsonResult = try JSONDecoder().decode(CycloidesModal.self, from: data)
                    completion(jsonResult.rows, nil)
                    print(jsonResult)
                        print("Decode Successfull")
                    
                }catch let error {
                    print("Failed to decode data: \(error.localizedDescription)")
                }
                
                }.resume()
        }
        
    }
}


final class MIReachability {
    
    class func isConnectedToNetwork() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        return (isReachable && !needsConnection)
    }
    
}
