//
//  ForgotPasswordView.swift
//  news-app
//
//  Created by minhnv1 on 21/03/2024.
//

import SwiftUI

struct ForgotPasswordView: View {
    @StateObject var interactor = ForgotPasswordInteractor()
    var body: some View {
        ScrollView {
            VStack(alignment: .center, content: {
                Image("icon_news_logo")
                    .padding()
                Text("News 24")
                    .padding(EdgeInsets.init(top: 8, leading: 0, bottom: 32, trailing: 0))
                    .font(.system(size: 17, weight: .semibold))
                VStack {
                    HStack {
                        Text("Enter your email to be sent a reset password link.")
                        Spacer()
                    }
                    Spacer().frame(height: 14)
                    HStack {
                        Text("Email")
                            .font(.system(size: 14, weight: .regular))
                        Spacer()
                    }
                    VStack {
                        TextField("Email", text: $interactor.email)
                        Rectangle()
                            .frame(height: 1)
                            .foregroundStyle(.gray)
                        Text($interactor.email.wrappedValue)
                    }

                    Button("Reset") {
                        //action
                    }
                    .buttonStyle(.bordered)
                }
                .padding(.horizontal)
                Spacer()
            })
        }
    }
}

#Preview {
    ForgotPasswordView()
}
