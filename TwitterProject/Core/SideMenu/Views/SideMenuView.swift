//
//  SideMenuView.swift
//  TwitterProject
//
//  Created by Tetiana Hranchenko on 07.08.2022.
//

import SwiftUI

struct SideMenuView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Circle()
                    .frame(width: 48, height: 48)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Bruce Wayne")
                        .font(.headline)
                    
                    Text("@batman")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                UserStatusView()
                    .padding(.vertical)
            }
            .padding(.leading)
            
            ForEach(SideMenuViewModel.allCases, id: \.rawValue) { viewModel in
                if viewModel == .profile {
                    NavigationLink {
                        ProfileView()
                    } label: {
                        SideMenuOptionView(viewModel: viewModel)
                    }
                } else if viewModel == .logout {
                    Button {
                        authViewModel.showMenu = false
                        authViewModel.signOut()
                    } label: {
                        SideMenuOptionView(viewModel: viewModel)
                    }                    
                } else {
                    SideMenuOptionView(viewModel: viewModel)
                }
            }
            Spacer()
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
} 
