//
//  ContentView.swift
//  code-with-chris-tutorial
//
//  Created by Kareha on 1/25/21.
//


import SwiftUI

struct ContentView: View {
    @State var showMenu = false
    
    var body: some View {
        
        return NavigationView {
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    MainView(showMenu: self.$showMenu)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x: self.showMenu ? geometry.size.width/2 : 0)
                        .disabled(self.showMenu ? true : false)
                    if self.showMenu {
                        MenuView()
                            .frame(width: geometry.size.width/2)
                            .transition(.move(edge: .leading))
                    }
                }
            }
            .navigationBarItems(leading: (
                                Button(action: {
                                    withAnimation {
                                        self.showMenu.toggle()
                                    }
                                }) {
                                    Image(systemName: "line.horizontal.3")
                                        .imageScale(.large)
                                }
                            ))
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}

struct MainView: View {
    
    @Binding var showMenu: Bool
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {

  
        ZStack {
            if colorScheme == .dark {
                Image("barbell_2nd_lighter").resizable().aspectRatio(contentMode: .fill).ignoresSafeArea()
            } else {
                Image("barbell").resizable().aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/).ignoresSafeArea().opacity(0.1)
            }
            
            VStack {
                Spacer()
                Text("Gym Buddies")
                    .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
//                Spacer()
                
//                sportscourt.fill
                Image(systemName: "sportscourt")
                    .padding(.top)
                    .font(.system(size: 65, weight: .light))
                    
                
                Spacer()
                
//                just examples
                Button(action: {
                    print("Button action")
                }) {
                    Text("Create Account").font(.title).padding(30.0)
                }.overlay(
                    RoundedRectangle(cornerRadius: 10.0)
                        .stroke(lineWidth: 2.0))
                
                Spacer()
                
                Button(action: {
                    print("Button action")
                }) {
                    Text("Login with Google").font(.title).padding(30.0)
                }.overlay(
                    RoundedRectangle(cornerRadius: 10.0)
                        .stroke(lineWidth: 2.0))
                    
                Spacer()
            }
        }
        
        
    }
}
