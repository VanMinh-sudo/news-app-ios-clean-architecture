//
//  ForgotPasswordInteractor.swift
//  news-app
//
//  Created by minhnv1 on 22/03/2024.
//

import Foundation
import Combine

class ForgotPasswordInteractor: ObservableObject {
    @Published var email = "email"

    private var cancellable = Set<AnyCancellable>()

    init() {
        email.publisher.eraseToAnyPublisher().sink { string in
            print("change")
        }
        .store(in: &cancellable)
    }
}
