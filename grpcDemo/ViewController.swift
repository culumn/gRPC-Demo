//
//  ViewController.swift
//  grpcDemo
//
//  Created by Yoshiteru Matsuoka on 2017/06/09.
//  Copyright © 2017年 Yoshiteru Matsuoka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let userName = "culumn"
    let hostName = "localhost:50051"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let service = Proto_UserServiceService(address: hostName)
        // make requests
        let createRequest = makeCreateRequest(age: 10, name: userName, sex: .male)
        let getRequest = makeGetRequest(name: userName)
        let updateRequest = makeUpdateRequest(age: 20, name: userName, sex: .female)
        let deleteRequest = makeDeleteRequest(name: userName)
        let getAllRequest = Proto_GetAllRequest()
        
        do {
            let createResponse = try service.create(createRequest)
            let getResponse = try service.get(getRequest)
            let updateResponse = try service.update(updateRequest)
            let deleteResponse = try service.delete(deleteRequest)
            // create two users
            let _ = try service.create(makeCreateRequest(age: 18, name: "Taro", sex: .male))
            let _ = try service.create(makeCreateRequest(age: 20, name: "Kaori", sex: .female))
            let getAllResponse = try service.getall(getAllRequest)
            
            print(createResponse)
            print(getResponse)
            print(updateResponse)
            print(deleteResponse)
            print(getAllResponse)
        } catch(let error)  {
            print(error)
        }
        
    }
}

// MARK: Helpers

extension ViewController {
    
    func makeCreateRequest(age: Int32, name: String, sex: Proto_Sex) -> Proto_CreateRequest {
        var req = Proto_CreateRequest()
        req.age = age
        req.name = name
        req.sex = sex
        return req
    }
    
    func makeGetRequest(name: String) -> Proto_GetRequest {
        var req = Proto_GetRequest()
        req.name = name
        return req
    }
    
    func makeUpdateRequest(age: Int32, name: String, sex: Proto_Sex) -> Proto_UpdateRequest {
        var req = Proto_UpdateRequest()
        req.age = age
        req.name = name
        req.sex = sex
        return req
    }
    
    func makeDeleteRequest(name: String) -> Proto_DeleteRequest {
        var req = Proto_DeleteRequest()
        req.name = name
        return req
    }
}
