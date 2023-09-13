import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var isSecurePassword = true
    
    private var isLoginDisabled: Bool {
        return username.isEmpty && password.isEmpty
    }
    
    var body: some View {
        ZStack {
            Image("backgroundimage")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .opacity(1.0)
            
            VStack{
                Text("Sign In")
                    .foregroundColor(.white)
                    .font(.system(size:40, design:.rounded))
                    .offset(y: -220)
                
                TextField("Username", text: $username)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .offset(y: -180)
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                    .offset(y: -180)
                
                HStack {
                    if  isSecurePassword {
                        SecureField("Password",text: $password)
                            .accentColor(.white)
                    } else {
                        TextField("Password", text: $password)
                            .accentColor(.white)
                    }
                    
                    Button(action: {
                        isSecurePassword.toggle()
                    }) {
                        Image(systemName: isSecurePassword ? "eye.slash.fill" : "eye.fill")
                            .foregroundColor(.white)
                    }
                }
                .foregroundColor(.white)
                .textFieldStyle(.plain)
                .offset(y: -140)
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                    .offset(y: -140)
                Button(action: {
                    
                }) {
                    Text("Login")
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(Color.white.opacity(0.5))
                        )
                        .foregroundColor(.red)
                    
                }.offset(y: -100)
                    .disabled(isLoginDisabled)
                Button(action: {
                    
                }) {
                    Text("Forgot Password?")
                        .bold()
                        .foregroundColor(.white)
                }.offset(y: -70)
            }
            .frame(width: 350)
            
        }
        
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
