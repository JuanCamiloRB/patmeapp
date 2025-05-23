//
//  LoginAuth0Interactor.swift
//  PatMe
//
//  Created by Juan Camilo on 9/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LoginAuth0BusinessLogic
{
  func doSomething(request: LoginAuth0.Something.Request)
}

protocol LoginAuth0DataStore
{
  //var name: String { get set }
}

class LoginAuth0Interactor: LoginAuth0BusinessLogic, LoginAuth0DataStore
{
  var presenter: LoginAuth0PresentationLogic?
  var worker: LoginAuth0Worker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: LoginAuth0.Something.Request)
  {
    worker = LoginAuth0Worker()
    worker?.doSomeWork()
    
    let response = LoginAuth0.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
