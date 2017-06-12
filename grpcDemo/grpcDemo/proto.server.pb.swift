/*
 * DO NOT EDIT.
 *
 * Generated by the protocol buffer compiler.
 * Source: proto/user.proto
 *
 */

/*
 * Copyright 2017, gRPC Authors All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import Foundation
import Dispatch
import gRPC

/// Type for errors thrown from generated server code.
internal enum Proto_UserServiceServerError : Error {
  case endOfStream
}

/// To build a server, implement a class that conforms to this protocol.
internal protocol Proto_UserServiceProvider {
  func create(request : Proto_CreateRequest, session : Proto_UserServiceCreateSession) throws -> Proto_CreateResponse
  func get(request : Proto_GetRequest, session : Proto_UserServiceGetSession) throws -> Proto_GetResponse
  func getall(request : Proto_GetAllRequest, session : Proto_UserServiceGetAllSession) throws -> Proto_GetAllResponse
  func update(request : Proto_UpdateRequest, session : Proto_UserServiceUpdateSession) throws -> Proto_UpdateResponse
  func delete(request : Proto_DeleteRequest, session : Proto_UserServiceDeleteSession) throws -> Proto_DeleteResponse
}

/// Common properties available in each service session.
internal class Proto_UserServiceSession {
  fileprivate var handler : gRPC.Handler
  internal var requestMetadata : Metadata { return handler.requestMetadata }

  internal var statusCode : Int = 0
  internal var statusMessage : String = "OK"
  internal var initialMetadata : Metadata = Metadata()
  internal var trailingMetadata : Metadata = Metadata()

  fileprivate init(handler:gRPC.Handler) {
    self.handler = handler
  }
}

// Create (Unary)
internal class Proto_UserServiceCreateSession : Proto_UserServiceSession {
  private var provider : Proto_UserServiceProvider

  /// Create a session.
  fileprivate init(handler:gRPC.Handler, provider: Proto_UserServiceProvider) {
    self.provider = provider
    super.init(handler:handler)
  }

  /// Run the session. Internal.
  fileprivate func run(queue:DispatchQueue) throws {
    try handler.receiveMessage(initialMetadata:initialMetadata) {(requestData) in
      if let requestData = requestData {
        let requestMessage = try Proto_CreateRequest(serializedData:requestData)
        let replyMessage = try self.provider.create(request:requestMessage, session: self)
        try self.handler.sendResponse(message:replyMessage.serializedData(),
                                      statusCode:self.statusCode,
                                      statusMessage:self.statusMessage,
                                      trailingMetadata:self.trailingMetadata)
      }
    }
  }
}

// Get (Unary)
internal class Proto_UserServiceGetSession : Proto_UserServiceSession {
  private var provider : Proto_UserServiceProvider

  /// Create a session.
  fileprivate init(handler:gRPC.Handler, provider: Proto_UserServiceProvider) {
    self.provider = provider
    super.init(handler:handler)
  }

  /// Run the session. Internal.
  fileprivate func run(queue:DispatchQueue) throws {
    try handler.receiveMessage(initialMetadata:initialMetadata) {(requestData) in
      if let requestData = requestData {
        let requestMessage = try Proto_GetRequest(serializedData:requestData)
        let replyMessage = try self.provider.get(request:requestMessage, session: self)
        try self.handler.sendResponse(message:replyMessage.serializedData(),
                                      statusCode:self.statusCode,
                                      statusMessage:self.statusMessage,
                                      trailingMetadata:self.trailingMetadata)
      }
    }
  }
}

// GetAll (Unary)
internal class Proto_UserServiceGetAllSession : Proto_UserServiceSession {
  private var provider : Proto_UserServiceProvider

  /// Create a session.
  fileprivate init(handler:gRPC.Handler, provider: Proto_UserServiceProvider) {
    self.provider = provider
    super.init(handler:handler)
  }

  /// Run the session. Internal.
  fileprivate func run(queue:DispatchQueue) throws {
    try handler.receiveMessage(initialMetadata:initialMetadata) {(requestData) in
      if let requestData = requestData {
        let requestMessage = try Proto_GetAllRequest(serializedData:requestData)
        let replyMessage = try self.provider.getall(request:requestMessage, session: self)
        try self.handler.sendResponse(message:replyMessage.serializedData(),
                                      statusCode:self.statusCode,
                                      statusMessage:self.statusMessage,
                                      trailingMetadata:self.trailingMetadata)
      }
    }
  }
}

// Update (Unary)
internal class Proto_UserServiceUpdateSession : Proto_UserServiceSession {
  private var provider : Proto_UserServiceProvider

  /// Create a session.
  fileprivate init(handler:gRPC.Handler, provider: Proto_UserServiceProvider) {
    self.provider = provider
    super.init(handler:handler)
  }

  /// Run the session. Internal.
  fileprivate func run(queue:DispatchQueue) throws {
    try handler.receiveMessage(initialMetadata:initialMetadata) {(requestData) in
      if let requestData = requestData {
        let requestMessage = try Proto_UpdateRequest(serializedData:requestData)
        let replyMessage = try self.provider.update(request:requestMessage, session: self)
        try self.handler.sendResponse(message:replyMessage.serializedData(),
                                      statusCode:self.statusCode,
                                      statusMessage:self.statusMessage,
                                      trailingMetadata:self.trailingMetadata)
      }
    }
  }
}

// Delete (Unary)
internal class Proto_UserServiceDeleteSession : Proto_UserServiceSession {
  private var provider : Proto_UserServiceProvider

  /// Create a session.
  fileprivate init(handler:gRPC.Handler, provider: Proto_UserServiceProvider) {
    self.provider = provider
    super.init(handler:handler)
  }

  /// Run the session. Internal.
  fileprivate func run(queue:DispatchQueue) throws {
    try handler.receiveMessage(initialMetadata:initialMetadata) {(requestData) in
      if let requestData = requestData {
        let requestMessage = try Proto_DeleteRequest(serializedData:requestData)
        let replyMessage = try self.provider.delete(request:requestMessage, session: self)
        try self.handler.sendResponse(message:replyMessage.serializedData(),
                                      statusCode:self.statusCode,
                                      statusMessage:self.statusMessage,
                                      trailingMetadata:self.trailingMetadata)
      }
    }
  }
}


/// Main server for generated service
internal class Proto_UserServiceServer {
  private var address: String
  private var server: gRPC.Server
  private var provider: Proto_UserServiceProvider?

  /// Create a server that accepts insecure connections.
  internal init(address:String,
              provider:Proto_UserServiceProvider) {
    gRPC.initialize()
    self.address = address
    self.provider = provider
    self.server = gRPC.Server(address:address)
  }

  /// Create a server that accepts secure connections.
  internal init?(address:String,
               certificateURL:URL,
               keyURL:URL,
               provider:Proto_UserServiceProvider) {
    gRPC.initialize()
    self.address = address
    self.provider = provider
    guard
      let certificate = try? String(contentsOf: certificateURL, encoding: .utf8),
      let key = try? String(contentsOf: keyURL, encoding: .utf8)
      else {
        return nil
    }
    self.server = gRPC.Server(address:address, key:key, certs:certificate)
  }

  /// Start the server.
  internal func start(queue:DispatchQueue = DispatchQueue.global()) {
    guard let provider = self.provider else {
      assert(false) // the server requires a provider
    }
    server.run {(handler) in
      print("Server received request to " + handler.host
        + " calling " + handler.method
        + " from " + handler.caller
        + " with " + String(describing:handler.requestMetadata) )

      do {
        switch handler.method {
        case "/proto.UserService/Create":
          try Proto_UserServiceCreateSession(handler:handler, provider:provider).run(queue:queue)
        case "/proto.UserService/Get":
          try Proto_UserServiceGetSession(handler:handler, provider:provider).run(queue:queue)
        case "/proto.UserService/GetAll":
          try Proto_UserServiceGetAllSession(handler:handler, provider:provider).run(queue:queue)
        case "/proto.UserService/Update":
          try Proto_UserServiceUpdateSession(handler:handler, provider:provider).run(queue:queue)
        case "/proto.UserService/Delete":
          try Proto_UserServiceDeleteSession(handler:handler, provider:provider).run(queue:queue)
        default:
          break // handle unknown requests
        }
      } catch (let error) {
        print("Server error: \(error)")
      }
    }
  }
}
