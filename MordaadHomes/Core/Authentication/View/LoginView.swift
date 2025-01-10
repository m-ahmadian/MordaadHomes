//
//  LoginView.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2024-11-27.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var contentViewModel: ContentViewModel
    @Environment(\.dismiss) var dismiss
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                // logo image
                Image("MordaadHomesLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding()
                
                // text fields
                VStack {
                    TextField("Enter your email", text: $email)
                        .textInputAutocapitalization(.none)
                        .standardTextFieldModifier()
                    
                    SecureField("Enter your password", text: $password)
                        .standardTextFieldModifier()
                }
                
                NavigationLink {
                    Text("Forgot Password")
                } label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                Button {
                    Task {
                        await login()
                    }
                } label: {
                    Text(contentViewModel.isAuthenticating ? "" : "Login")
                        .foregroundColor(.white)
                        .standardButtonModifier()
                        .overlay {
                            if contentViewModel.isAuthenticating {
                                ProgressView()
                                    .tint(.white)
                            }
                        }
                }
                .disabled(contentViewModel.isAuthenticating || !formIsValid)
                .opacity(formIsValid ? 1.0 : 0.7)
                .padding(.vertical)

                Spacer()
                
                Divider()
                
                NavigationLink {
                    Text("Sign up here..")
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
                .padding(.vertical, 16)
                
            }
            .alert(isPresented: $contentViewModel.showAlert) {
                Alert(title: Text("Error"), message: Text("Please try again.."))
            }
        }
    }
    
    // MARK: - Private Methods
    
    private func login() async {
        await contentViewModel.login(email: email, password: password)
        if contentViewModel.isAuthenticating {
            dismiss()
        }
    }
}

extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
    }
}

#Preview {
    LoginView()
        .environmentObject(ContentViewModel(authService: AuthService(), userService: UserService()))
}
