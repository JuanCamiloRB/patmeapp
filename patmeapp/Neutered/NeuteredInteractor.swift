//
//  NeuteredInteractor.swift
//  patmeapp
//
//  Created by Juan Camilo on 14/01/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol NeuteredBusinessLogic
{
  func doSomething(request: Neutered.Something.Request)
}

protocol NeuteredDataStore
{
  //var name: String { get set }
}

class NeuteredInteractor: NeuteredBusinessLogic, NeuteredDataStore
{
  var presenter: NeuteredPresentationLogic?
  var worker: NeuteredWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: Neutered.Something.Request)
  {
    worker = NeuteredWorker()
    worker?.doSomeWork()
    
    let response = Neutered.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
