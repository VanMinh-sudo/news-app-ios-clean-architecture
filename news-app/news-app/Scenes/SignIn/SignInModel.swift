//
//  SignInModel.swift
//  news-app
//
//  Created by minhnv1 on 01/03/2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the VIP Swift Xcode Templates(https://github.com/Andrei-Popilian/VIP_Design_Xcode_Template)
//  so you can apply clean architecture to your iOS and MacOS projects,
//  see more http://clean-swift.com
//


import Foundation

enum SignInModel {
  
  enum Request {
    case doSomething(item: Int)
  }
  
  enum Response {
    case doSomething(newItem: Int, isItem: Bool)
  }
  
  enum ViewModel {
    case doSomething(viewModelData: NSObject)
  }
  
  enum Route {
    case dismissSignInScene
    case xScene(xData: Int)
  }
  
  struct DataSource {
    //var test: Int
  }
}
