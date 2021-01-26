//
//  ContentView.swift
//  code-with-chris-tutorial
//
//  Created by Kareha on 1/25/21.
//

// a hamburger menu!

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
    
    var body: some View {
        
        VStack {
            Spacer()

            Image("dog").resizable().aspectRatio(contentMode: .fit)

            Spacer()

            HStack() {
                Spacer()
                Text("Hello!").padding().background(Color.blue)
                Text("Hello world")
                Spacer()
            }
        }
        
    }
}
