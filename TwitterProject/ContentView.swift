//
//  ContentView.swift
//  TwitterProject
//
//  Created by Tetiana Hranchenko on 04.08.2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            // no user logged in
            if viewModel.userSession == nil {
                LoginView()
            } else {
                // have a logged in user
                mainInterfaceView
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    var mainInterfaceView: some View {
        ZStack(alignment: .topLeading) {
            MainTabView()
                .navigationBarHidden(viewModel.showMenu)
            
            if viewModel.showMenu {
                ZStack {
                    Color(.black)
                        .opacity(viewModel.showMenu ? 0.25 : 0.0)
                } .onTapGesture {
                    withAnimation {
                        viewModel.showMenu = false
                    }
                }
                .ignoresSafeArea()
            }
            
            SideMenuView()
                .frame(width: 300)
                .offset(x: viewModel.showMenu ? 0 : -300, y: 0)
                .background(viewModel.showMenu ? Color.white : Color.clear)
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    withAnimation {
                        viewModel.showMenu = true
//                        viewModel.showMenu.toggle()
                    }
                } label: {
                    Circle()
                        .frame(width: 32, height: 32)
                }
            }
        }
    }
}
