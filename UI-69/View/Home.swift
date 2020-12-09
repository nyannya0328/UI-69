//
//  Home.swift
//  UI-69
//
//  Created by にゃんにゃん丸 on 2020/12/09.
//

import SwiftUI

struct Home: View {
    var window = NSScreen.main?.visibleFrame
    
    @State var Card = ""
    @State var password = ""
    @State var toggle = false
    @State var alert = false
    
    var body: some View {
        HStack{
            
            Spacer()
            
            VStack{
                
                Spacer(minLength: 0)
                
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .background(Color.white)
                
                Text("Welcome")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .padding(.vertical,10)
                
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    HStack{
                        Image("google")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                        Spacer(minLength: 0)
                        
                        
                        Text("Login With Google")
                            .foregroundColor(.black)
                        
                    }
                    .padding(.vertical,8)
                    .padding(.horizontal)
                    .background(Color.white)
                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: -5, y: -5)
                    .cornerRadius(10)
                })
                .buttonStyle(PlainButtonStyle())
                .padding(.vertical)
                
                HStack{
                    
                    Rectangle()
                        .fill(Color.gray.opacity(0.5))
                        .frame(height: 1)
                    
                    Text("or")
                        .foregroundColor(.gray)
                    
                    Rectangle()
                        .fill(Color.gray.opacity(0.5))
                        .frame(height: 1)
                    
                    
                }
                
                Group{
                    
                
                    TextField("Enter Your CardNumber", text: $Card)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.vertical,10)
                        .padding(.horizontal)
                        .background(RoundedRectangle(cornerRadius: 1).stroke(Color.gray.opacity(0.7),lineWidth: 1))
                        .onChange(of: Card, perform: { value in generatecard()
                            cancel()
                        })
                                                    
                                                    
                                                    
                                                   
              
                       
                        
                        
                    
                    
                    SecureField("Enter User Password", text: $password)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.vertical,10)
                        .padding(.horizontal)
                        .background(RoundedRectangle(cornerRadius: 1).stroke(Color.gray.opacity(0.7),lineWidth: 1))
                        .padding(.vertical)
                        
                        
                    
                    
                    HStack{
                        
                        Toggle("", isOn: $toggle)
                            .labelsHidden()
                            .toggleStyle(CheckboxToggleStyle())
                        Text("Keep Login")
                            .foregroundColor(.gray)
                        
                        Spacer(minLength: 0)
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Forget Password")
                                .foregroundColor(.black)
                                .underline(true, color: Color.black)
                        })
                        .buttonStyle(PlainButtonStyle())
                        
                        
                        
                        
                    }
                    
                    Button(action: {
                        
                        withAnimation(.spring()){alert.toggle()}
                        
                    }, label: {
                        HStack{
                            Spacer()
                            Text("Login")
                            
                            Spacer()
                            
                            Image(systemName: "arrow.right")
                                
                            
                            
                        }
                        .foregroundColor(.white)
                            
                           
                        
                        .padding(.vertical,10)
                        .padding(.horizontal)
                        .background(
                        
                            LinearGradient(gradient: .init(colors: [.red,.blue]), startPoint: .leading, endPoint: .trailing)
                        )
                        .cornerRadius(15)
                        
                    })
                    .buttonStyle(PlainButtonStyle())
                    .padding(.top)
                    
                    
                    HStack{
                        
                        Text("Don't For get Password")
                            .foregroundColor(.gray)
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            HStack{
                                
                                Text("Sign up")
                                    .foregroundColor(.blue)
                                    .underline(true, color: Color.black)
                            }
                                
                        })
                        .buttonStyle(PlainButtonStyle())
                    }
                    .padding(.top,15)
                    
                    
                    
                }
               
                
                
                
               
                
                Spacer(minLength: 0)
            }
            .padding(.horizontal,50)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            VStack{
                
                Spacer()
                
                VStack{
                    
                    Text("Love")
                        .font(.system(size: 150, weight: .heavy))
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(20)
                
                Image("p1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.leading,-350)
                    .clipShape(Circle())
                    
                }
                Spacer()
            }
            .frame(width: (window!.width / 1.8) / 2)
            .background(Color("c1"))
            
            
        }
        .ignoresSafeArea(.all, edges: .all)
        .frame(width: window!.width / 1.8, height: window!.height - 100)
        .preferredColorScheme(.light)
       
        
        .alert(isPresented: $alert, content: {
            
            
             
            
            Alert(title: Text("Message"), message: Text("Success"), dismissButton:.destructive(Text("Back")))
            
            
        })
       
        
    }
    
    
    func generatecard(){
        
        let numer = Card.replacingOccurrences(of: "-", with: "")
        if (numer.count) % 4 == 0 && !numer.isEmpty{
            
            if !String(Card.last!).elementsEqual("-"){
                
                
                Card.append("-")
            }
            
        }
        
    }
    
    func cancel(){
        
        
        let number = Card.replacingOccurrences(of: "", with: "")
        if (number.count) % 15 == 0 && !number.isEmpty{
            
            
            if !String(Card.last!).elementsEqual(""){
                
                Card.removeLast()
            }
        }
    }
    
    
    
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
