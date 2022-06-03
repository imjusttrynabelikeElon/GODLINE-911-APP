//
//  ContentView.swift
//  the real 911 app
//
//  Created by Karon Bell on 5/14/22.
//


import SwiftUI
import MapKit
import CoreLocationUI
import UIKit
import FirebaseCore
import Firebase
import FirebaseAuth

import FirebaseFirestore






 struct ContentView: View {
     
   
     
     @State var isLoginMode = false
    @State var email = ""
    @State var password = ""
    @State var fullname = ""
    @State var lname = ""
    @State var StatusMessage = ""
     @State var phonenumber = ""
     @State var homeaddress = ""
     @State var emergencycontact = ""
     @State var age = ""
     @State var isthisPersonfamilyorFriend = ""
    
     @State var selection: String = "Login"
     let pickwhichone: [String] = [
     "Login", "Create Account"]
     
    @State var shouldShowImagePicker = false
    @State var image: UIImage?
     
    var body: some View {
       
        ScrollView {
     
        
        
      
            
        ZStack {
                
           
            Color.black
                    .edgesIgnoringSafeArea(.all)
                    .preferredColorScheme(.dark)
                
            VStack(spacing: 10) {
                Picker(selection: $isLoginMode, label: IntroView()) {
                   
                        Text("Login")
                        .tag(true)
                    
                      
                    Text("Create Account")
                        .tag(false)
                        
                    
                      
                }.pickerStyle(SegmentedPickerStyle())
                            
                
                       
                           
        
                        
               
                     
                    if !isLoginMode {
                        Button {
                            shouldShowImagePicker.toggle()
                        } label: {
                            VStack {
                                Image(systemName: "person.fill")
                                    .font(.system(size: 64))
                                    .padding()
                                    .foregroundColor(Color(.white))
                            }
                            .overlay(RoundedRectangle(cornerRadius: 64)
                                        .stroke(Color.white, lineWidth: 3)
                            )
                        }
                        .preferredColorScheme(.light)
                        
                      
                    
                
                   
                        
                        Group {
                            TextField("Full Name", text: $fullname)
                                .preferredColorScheme(.light)
                            TextField("Email", text: $email)
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                                .preferredColorScheme(.light)
                            TextField("age", text: $age)
                            TextField("Home Address/apt#", text: $homeaddress)
                            TextField("Emergency Contact..trusted family/friend", text: $emergencycontact)
                            TextField("is this Contact family or a Friend?", text: $isthisPersonfamilyorFriend)
                            SecureField("Password", text: $password)
                                .preferredColorScheme(.light)
                        }
                        .preferredColorScheme(.light)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .pickerStyle(SegmentedPickerStyle())
                        .navigationBarTitle("Create Account")
                     
                           
                        
                    
                        
                        
                       
                        
                     
                        
                        
                        
                       
                        Button {
                            handleAction()
                       
                              
                            
                        } label: {
                            HStack {
                                Spacer()
                                
                                NavigationLink {
                                    IntroView()
                                        .navigationBarBackButtonHidden(true)
                                        .edgesIgnoringSafeArea(.all)
                                     
                                        
                                       
                                }
                                  label:
                              {
                                    Text("Create Account")
                                        .foregroundColor(.white)
                                        .padding(.vertical, 10)
                                        .padding(.top, 1)
                                        .font(.system(size: 18, weight: .semibold))
                                        .preferredColorScheme(.light)
                                       
                                     
                                  
                                  
                                  
                                 
                                      
                                }
                                Spacer()
                            }.background(Color.blue)
      
                        }.cornerRadius(10)
                          
                    
                        
                      
                        if !isLoginMode {
                            NavigationLink {
                                IntroView()
                            } label: {
                                
                            }
                        }
                  
                  
                  
                        
                    
                    } else {
                        Image("Login")
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.top, 10)
                            .font(.system(size: 18, weight: .semibold))
                            .preferredColorScheme(.light)
                          
                    
                        VStack {
                            Text("Login To GODLINE")
                                .bold()
                                .foregroundColor(Color.white)
                            Text("Faster/Safer Way To Call 911")
                                .bold()
                                .padding(.bottom, 19)
                                .foregroundColor(Color.white)
                              
                        }
                          
              
                
                            Image(systemName: "network")
                                .resizable()
                                .foregroundColor(Color.white)
                                .frame(width: 300, height: 250, alignment: .center)
                                .padding(.top, 3)
                                .padding(.bottom, 23)
                        
                                    
                                        
                    
                                      

                        Group {
                            TextField("Email", text: $email)
                                .preferredColorScheme(.light)
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                                .preferredColorScheme(.light)
                            SecureField("Password", text: $password)
                          
                        }
                      
                        .preferredColorScheme(.light)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .preferredColorScheme(.light)
                        .navigationBarTitle("Login")
                        
            
                        
                    
                      
                        if !isLoginMode {
                           
                                if !isLoginMode {
                                    ContentView()
                                        .preferredColorScheme(.light)
                                } else {
                                    IntroView()
                                        .preferredColorScheme(.dark)
                                        
                                    
                                }
                            
                          
                        }
                        
                        
                     
       
                         
                        Button {
                            loginUser()
                              
                            
                        } label: {
                            HStack {
                                Spacer()
                                
                                NavigationLink {
                                    IntroView()
                                     
                                        
                                       
                                }
                                  label:
                              {
                                    Text("Login")
                            
                                        .foregroundColor(.white)
                                        .padding(.vertical, 10)
                                        .padding(.top, 10)
                                        .font(.system(size: 18, weight: .semibold))
                                        .preferredColorScheme(.light)
                                     
                                  
                                  
                                  
                                 
                                      
                                }
                                Spacer()
                            }.background(Color.blue)
      
                        }.cornerRadius(10)
                       
                    }
                     
                    Text(self.StatusMessage)
                        .foregroundColor(Color.white)
                }
                .padding()
            
               
        }  //End ScrollView
            .navigationViewStyle(StackNavigationViewStyle())
            .background(
                        LinearGradient(gradient: Gradient(colors: [.white, .blue]), startPoint: .top, endPoint: .bottom)
                            .edgesIgnoringSafeArea(.all)
                            .preferredColorScheme(.light)
                            
                            )
           
        
         // End Navigation
            .colorScheme(.light)
        
        
           
            
          
            
   
          
    }
      
       
      
     
            }
     
    
         
     
     
     
  
              
     func loginUser() {
        Auth.auth().signIn(withEmail: email, password: password) { result, err in
            if let err = err {
                print("Failed to login user:", err)
                self.StatusMessage = "Failed to login user: \(err)"
                return
            }
  
            print("Successfully logged in as user: \(result?.user.uid ?? "")")
            
  
            self.StatusMessage = "Successfully logged in as user: \(result?.user.uid ?? "")"
            

        }
       
    }
     
     func handleAction() {
         
        
             createNewAccount()
        
         
         
     }
     
     func createNewAccount() {
        Auth.auth().createUser(withEmail: email, password: password) { result, err in
            if let err = err {
                print("Failed to create user:", err)
                self.StatusMessage = "Failed to create user: \(err)"
                return
            }
  
            print("Successfully created user: \(result?.user.uid ?? "")")
  
            self.StatusMessage = "Successfully created user: \(result?.user.uid ?? "")"
  
            self.storeUserInformation()
               
        }
      
    }
     
     func storeUserInformation() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
         let userData = ["fullname": self.fullname, "email": self.email, "homeaddress": self.homeaddress, "emergencycontact": self.emergencycontact, "is this Contact family or a Friend?": self.isthisPersonfamilyorFriend, "age": self.age, "uid": uid]
         
        Firestore.firestore().collection("users")
            .document(uid).setData(userData) { err in
                if let err = err {
                    print(err)
                    self.StatusMessage = "\(err)"
                    return
                }
 
                print("Success")
                   
                
            }
           
     }
        
         
      
}

 
 

struct Mapview: View {
    @StateObject private var viewModel = MapViewModel()
   
    var body: some View {
        ZStack(alignment: .bottom) {
            
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
                .ignoresSafeArea()
                .tint(.pink)
            
            
            LocationButton(.currentLocation ) {
                viewModel.requestAllowOnceLocationPermission()
            }
            .foregroundColor(.white)
            .cornerRadius(8)
            .labelStyle(.iconOnly)
            .symbolVariant(.fill)
            .tint(.blue)
            .padding(.bottom, 50)
            
            
            NavigationLink {
                Instrutions()
            } label: {
                
                    
            }
            
        }
        .preferredColorScheme(.dark)
    }
    
    
}



struct VideoOne: View {
        var body: some View {
           VideoView(videoID: "EzBPg71TL-o")
                .frame(minHeight: 0, maxHeight: UIScreen.main.bounds.height * 0.1)
                .cornerRadius(12)
                .padding(.horizontal, 24)
                .aspectRatio(contentMode: .fit)
            NavigationLink {
                Instrutions()
            } label: {
                
            }
            .preferredColorScheme(.dark)
        }

    }
    
  




 struct IntroView: View {
     
     
         let strNumber = "911"
     
         var body: some View {
            
             NavigationView {
                 ScrollView {
                
                 ZStack {
                     LinearGradient(gradient: Gradient(colors: [.black, .accentColor, .red]), startPoint: .top, endPoint: .bottom)
                         .ignoresSafeArea(.all)
                         
                        
                     VStack {
                         
                         VStack {
                             
                             
                             VStack {
                                 Spacer()
                                 Text("The New Era Of 911")
                                     .font(.largeTitle)
                                     .fontWeight(.bold)
                                     .foregroundColor(Color.white)
                                     
                             }
                                Spacer()
                             Text("GODLINE")
                                 .font(.largeTitle)
                                 .fontWeight(.black)
                                 .foregroundColor(Color.white)
                                 .font(.title)
                                 .padding(.top, 34.0)
                             Text("PRESS THE LOGO FOR GODLINE 911 HELP")
                                 .foregroundColor(Color.white)
                                  
                                  
                             Spacer()
                         }
                         
                         
                         VStack {
                             
                                 
                             NavigationLink {
                                 YellowThreeView(color: .red)
                                     
                                   
                                     
                             } label: {
                                 Image(systemName: "network")
                                     .resizable()
                                     .foregroundColor(Color.white)
                                     .frame(width: 300, height: 263, alignment: .center)
                                     .padding(.leading, 1)
                                     .padding(.bottom, 83)
                                     .padding(.top, 10)
                                 
                                 
                             }
                                     
                         
                            
                                 
                         
                         
                         Spacer()
                             
                         
                     
                         VStack {
                             
                             Button {
                              
                                 let tel = "tel://"
                                    let formattedString = tel + strNumber
                                    guard let url = URL(string: formattedString) else { return }
                                    UIApplication.shared.open(url)
                      


                             } label: {
                                 Text("QUICK CALL 911 NOW NO SIGN UP! PRESS ME")
                                     .font(.subheadline)
                                     .fontWeight(.black)
                                     .foregroundColor(Color.white)
                                     .padding(.bottom, 89)
                             }
                                 
                             Spacer()
                             
                             NavigationLink
                                     {
                                         ContentView()
                                 
                             } label: {
                                 Text("SIGN UP TO GiVE 911 MORE KEY INFORMATION ABOUT YOURSELF")
                                     .font(.caption2)
                                     .fontWeight(.black)
                                     .foregroundColor(Color.white)
                                     .padding(.bottom, 70)
                             }
                                 Spacer()
                             
                              
                                 NavigationLink {
                                     Instrutions()
                                 }
                              label: {
                                 Text("HOW DOES GODLINE WORK? PRESS TO FIND OUT")
                                     .font(.subheadline)
                                     .fontWeight(.black)
                                     .foregroundColor(Color.white)
                                     .padding(.bottom, 90)
                                     
                             }
                             Spacer()
                         }
                 Spacer()
                         
                 
                     }
                        
                         
                         
                        
                              
                         
                     
                     
                                 
                             
                     }
                             
                             
                               
                                    
                                 
                             
                 }
                 
                 
             } .preferredColorScheme(.dark)
                 .navigationBarHidden(true)
         
             }
             
             
             

     
     }
  

             }
             
              

struct YellowThreeView: View {
    var color: Color
    var body: some View {
        
        ScrollView {
        

        
         ZStack {
             LinearGradient(gradient: Gradient(colors: [.black]), startPoint: .top, endPoint: .bottom)
                 .edgesIgnoringSafeArea(.all)
             
             
      
             
             VStack {
                 
                
             
                 
                 
                 NavigationLink {
                     IntroView()
                         .navigationBarHidden(true)
                 }
                    label: {
                    Spacer()
                    Circle()
                         .fill(Color.white)
                         .frame(width: 199, height: 59)
                         .shadow(radius: 10)
                         .overlay(
                            Image(systemName: "network")
                                .aspectRatio(contentMode: .fill)
                                .font(.largeTitle)
                                
                             
                               
                                
                              
                               
                              
                                
                                
                                
                         
                         )
                 
                         .padding(.horizontal, -53)
                         .padding(.bottom, 613)
                        
                         
             }
                   
                 
              
             }
             
             
             
             VStack {
                 
               
                 
                 
              
                 
                 
                 CircleNumberView(color: .red, number: 3)
                     .padding(.top, 6)
                 Spacer()
                     .navigationTitle("Level THREE Danger")
                     .offset(y: -60)
                 NavigationLink {
                     BlueTwoView(color: .orange)
                         .preferredColorScheme(.dark)
                 } label: {
                     Text("Confirm")
                         .bold()
                         .frame(width: 280, height: 50)
                         .background(Color.blue)
                         .foregroundColor(Color.white)
                         .cornerRadius(10)
                         .padding(.leading, 10)
                         .padding(.bottom, 2)
                    
                 }
                 NavigationLink {
                     BlueTwoView(color: .orange)
                        
                 } label: {
                     Text("Level Two")
                         .bold()
                         .frame(width: 280, height: 50)
                         .background(Color.blue)
                         .foregroundColor(Color.white)
                         .cornerRadius(10)
                         .padding(.leading, 10)
                         .padding(.bottom, 2)
                         .padding()
                 }
                 
                 
    
                 
                 VStack {
                     
                     Text("Level 3 Category Includes:")
                         .font(.title)
                         .fontWeight(.medium)
                         .padding(.bottom, 3)
                     Text("FIRES, HOME INVASIONS, KIDNAPPING:")
                         .fontWeight(.bold)
                         .padding(.bottom, 1)
                     Text("BEING HELD HOSTAGE/ SEVERE ALLERGIES:")
                         .fontWeight(.bold)
                         .padding(.bottom, 1)
                     Text("POLICE NEED TO BREAK YOUR DOOR OPEN:")
                         .fontWeight(.bold)
                         .padding(.bottom, 10)
                     Text("TRAPPED IN A DANGEROUS SITUATION:")
                         .fontWeight(.bold)
                        
                         Spacer()
                     Text("OR SOMEBODY ELSE/ FOUND UNCONSCIOUS:")
                         .fontWeight(.bold)
                         .padding(.bottom, 30)
                     VStack {
                         Text("Any Dangerous Or Medical Emergency.")
                             .font(.title3)
                             .fontWeight(.heavy)
                         .padding(.bottom, 79)
                         .padding(.top, -36)
                     }
                    
                     VStack {
                         Text("(:THAT NEEDS MULTIPLE POLICE AT THE SCENE:)")
                             .fontWeight(.semibold)
                             .foregroundColor(Color.red)
                             .frame(width: 283, height: 53, alignment: .center)
                             .font(.subheadline)
                             .padding(.top, -97)
                     }
                     
                        
                     }
                   
                 


           }
        
           
            }
   
         .colorScheme(.dark)
        
        }
    }
}
                        


                
    

            
                        


                
    








struct BlueTwoView: View {
    var color: Color
    var body: some View {
        ScrollView {
        
         ZStack {
             LinearGradient(gradient: Gradient(colors: [.black]), startPoint: .top, endPoint: .bottom)
                 .edgesIgnoringSafeArea(.all)
             VStack {
                 
                 
                 CircleNumberView(color: color, number: 2)
                     .padding(.top, 6)
                 Spacer()
                     .navigationTitle("Level TWO Danger")
                     .offset(y: -60)
                 Spacer()
                 NavigationLink {
                     RedOneView(color: .yellow)
                     
                 } label: {
                     Text("Confirm")
                         .bold()
                         .frame(width: 280, height: 50)
                         .background(Color.blue)
                         .foregroundColor(Color.white)
                         .cornerRadius(10)
                         .padding(.leading, 10)
                         .padding(.bottom, 2)
                    
                 }
                 NavigationLink {
                     RedOneView(color: .yellow)
                 } label: {
                     Text("Level One")
                         .bold()
                         .frame(width: 280, height: 50)
                         .background(Color.blue)
                         .foregroundColor(Color.white)
                         .cornerRadius(10)
                         .padding(.leading, 10)
                         .padding(.bottom, 2)
                         .padding()
                 }
                 
                 VStack {
                     
                     Text("Level 2 Category Includes:")
                         .font(.title)
                         .fontWeight(.medium)
                         .padding(.bottom, 3)
                     Text("Health Problems , Allergics/ IN Labor ETC:")
                         .fontWeight(.bold)
                         .padding(.bottom, 1)
                     Text("Danger Is Around You And/ Or Others:")
                         .fontWeight(.bold)
                         .padding(.bottom, 1)
                     Text("Unconscious/Unresponsive Anyone or Thing:")
                         .fontWeight(.bold)
                         .padding(.bottom, 10)
                     Text("A Stalker or Sense Of Violence Is Around You")
                         .fontWeight(.bold)
                         
                     Text("Or SomebodyElse, Stuck In Elevator:")
                         .fontWeight(.bold)
                         .padding(.bottom, 20)
                     Text("Any Dangerous Or Medical Emergency.")
                         .font(.title3)
                         .fontWeight(.bold)
                         .padding(.bottom, 70)
                 }


           }
        
           
            }
         .colorScheme(.dark)
        }
    }
}





struct RedOneView: View {
    var color: Color
    var body: some View {
        ScrollView {
        
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.black]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                    
                
                VStack {
                
                    
                    
                    NavigationLink {
                        YellowThreeView(color: .yellow)
                           
                    }
                       label: {
                        Spacer()
                       Circle()
                            .fill(Color.red)
                            .frame(width: 99, height: 56)
                            .shadow(radius: 10)
                            .overlay(
                               Text("3")
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                                
                                .foregroundColor(Color.white)
                            
                            )
                            .padding(.horizontal, -1)
                            .padding(.bottom, 639)
                            
                }
                }
                
   
                
                
                
               
                VStack {
                    
                 
                    Spacer()
                    CircleNumberView(color: .yellow, number: 1 )
                       Spacer()
                        .navigationTitle("Level One Danger")
                        Spacer()
                        .offset(y: -6)
                    // if I turn off the scroll view change offset to -66. for all levels
                         
                    NavigationLink {
                        YellowThreeView(color: .yellow)
                    } label: {
                        Text("Confirm")
                            .bold()
                            .frame(width: 280, height: 50)
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                            .padding(.leading, 10)
                            .padding(.bottom, 2)
                    }
                    Spacer()
                    
                    NavigationLink {
                        YellowThreeView(color: .yellow)
                    } label: {
                        Text("Go Back")
                            .bold()
                            .frame(width: 280, height: 50)
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                            .padding(.leading, 10)
                            .padding(.bottom, 2)
                            .padding()
                    }
                    
                    VStack {
                        Text("Level 1 Category Includes:")
                            .font(.title)
                            .fontWeight(.medium)
                            .padding(.bottom, 3)
                        Text("Problems That Are Very Mild And / NonDeadly:")
                            .fontWeight(.bold)
                            .padding(.bottom, 1)
                        Text("Noise Complants:")
                            .fontWeight(.bold)
                            .padding(.bottom, 1)
                        Text("No Person or Things Life Is In Danger/Medical Health:")
                            .fontWeight(.bold)
                            .padding(.bottom, 10)
                        Text("You Just Have A Emergency Question")
                            .fontWeight(.bold)
                            
                        Text("Or You Have A Complant")
                            .fontWeight(.bold)
                            .padding(.bottom, 20)
                        Text("Level 1 Is For Your Questions/Complants.")
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.bottom, 19)
                        Spacer()
                            .padding(.bottom, 19)
                            .padding(.horizontal, 63)
                    }
                   
            }
           
            
                


            
        }
        .accentColor(Color(.label))
        .colorScheme(.dark)
        }
    }
    
}






struct CircleNumberView: View {
    
    var color: Color
    var number: Int
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 300, height: 250, alignment: .center)
                .aspectRatio(contentMode: .fill)
                .foregroundColor(color)
               Text("\(number)")
                .foregroundColor(.white)
                .font(.system(size: 70, weight: .bold))
            
        }
      
    }
}



struct Instrutions: View {
    
    var body: some View {
        ScrollView {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.black, .accentColor, .red]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                VStack {
                    Text("How To Navigate through GODLINE:")
                        .font(.title3)
                    .fontWeight(.heavy)
                    Spacer()
                }
                VStack {
                    Spacer()
                    Text(":FIRST OFF YOU HAVE TO SIGN UP TO START USING THE NEW EQUIPPED FEATURES OF THE 911 APP - GODLINE:")
                        .fontWeight(.black)
                        .frame(width: 385, height: 37, alignment: .center)
                        .font(.caption)
                        .padding(.bottom, 14)
                    Spacer()
                
                }
                VStack {
                    Text(":THE REASON IS SO 911 CAN ALREADY HAVE YOUR ADDRESS INFORMATION WHEN YOU PRESS WHICH EVER LEVEL OF EMERGENCY YOU HAVE BY PRESSING THE CONFIRM BUTTON:")
                        .fontWeight(.black)
                        .frame(width: 370, height: 63, alignment: .center)
                        .font(.caption)
                        .padding(.bottom, 9)
                    Spacer()
                }
                VStack {
                    Text(":AND YES 911 WILL COME TO YOUR AID AS SOON AS YOU PRESS CONFIRM ON THE LEVEL OF EMERGENCY YOU HAVE:")
                        .fontWeight(.black)
                        .frame(width: 370, height: 50, alignment: .center)
                        .font(.caption)
                        .padding(.bottom, 4)
                    
                }
                VStack {
                    Text(":YOU ALSO HAVE THE OPTION TO SPEAK TO A 911 OPERATOR AFTER YOU PRESS THE LEVEL OF EMERGENCY YOU HAVE")
                        .fontWeight(.heavy)
                        .frame(width: 360, height: 69, alignment: .center)
                        .font(.caption)
                        .padding(.bottom, 4)
                    
                }
                VStack {
                    Text(":NOW AS YOU CAN SEE FROM THE MAIN MENU YOU HAVE A OPTION TO QUICK CALL 911 WITHOUT SIGNING UP:")
                        .fontWeight(.heavy)
                        .frame(width: 360, height: 33, alignment: .center)
                        .font(.caption)
                        .padding(.bottom, 4)
                    Spacer()
                    
                }
                
                VStack {
                    Text(":THATS MAINLY FOR PEOPLE NEW TO THE APP WHO HAVE NOT SIGNED UP YET:")
                        .fontWeight(.heavy)
                        .frame(width: 361, height: 33, alignment: .center)
                        .font(.caption)
                        .padding(.bottom, 9)
                    Spacer()
                    
                }
                VStack {
                    Text(":ITS KEY TO SIGN UP RIGHT WHEN YOU DOWNLOAD GODLINE SO 911 ALREADY HAS YOUR ADDRESS INFO AND IS READY TO COME TO YOUR AID IN A PRESS OF A BUTTION")
                        .fontWeight(.heavy)
                        .frame(width: 360, height: 63, alignment: .center)
                        .font(.caption)
                        .padding(.bottom, 43)
                    
                    NavigationLink {
                        VideoView(videoID: "EzBPg71TL-o")
                    } label: {
                        
                        Text("Press To Find Out Which Level Of Danger To Select If Needed")
                            .font(.caption)
                            .fontWeight(.heavy)
                            .padding(.bottom, 15)
                            .frame(width: 816, height: 29, alignment: Alignment.top)
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                            .cornerRadius(400)
                    }
                    
                }
                VStack {
                    Text("OUR MAIN GOAL IS TO HELP BRING 911 TO PEOPLE FASTER THAN EVER AND BRING 911 TO THE TECHNOLOGY ERA - GODLINE")
                        .fontWeight(.heavy)
                        .foregroundColor(Color(hue: 1.0, saturation: 0.056, brightness: 0.001))
                        .multilineTextAlignment(.center)
                        .frame(width: 360, height: 63, alignment: .center)
                        .font(.callout)
                        .padding(.bottom, 1)
                    
                    
                        
                    
                }
                
                
                
                NavigationLink {
                    Mapview()
                } label: {
                    
                        Text("Heres The GPS GODLINE Uses To See Your Location Press Me")
                        .font(.footnote)
                            .fontWeight(.black)
                            .foregroundColor(Color.white)
                            .frame(width: 316, height: 39, alignment: Alignment.top)
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                            .cornerRadius(400)
                            .padding(.leading, 10)
                            .padding(.bottom, 49)
                            
                        
                    
                        
                    
                        
                        
                }
            
            }
            
            
        }
        .colorScheme(.dark)
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            
            
            IntroView()
             .colorScheme(.dark)
            //RedOneView(color: .yellow)
            
        }
                
      
           
        
       
    }
    
}


final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.79809, longitude: -73.94526), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
    
    let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func requestAllowOnceLocationPermission() {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latestLocation = locations.first else {
            // show an error
               return
        }
          
        DispatchQueue.main.async {
            self.region = MKCoordinateRegion(center: latestLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
 



