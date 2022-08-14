//
//  UserDetailTabBar.swift
//  Kumparan Recruitment
//
//  Created by Jonathan Andrei on 14/08/22.
//

import SwiftUI

struct UserDetailTabBar: View {
    
    @Binding var screen: Int
    
    var body: some View {
        VStack {
            Divider()
            
            HStack {
                Button(action: {
                    self.screen = 0
                }) {
                    VStack {
                        if self.screen == 0 {
                            Image(systemName: "square.grid.2x2")
                                .resizable()
                                .font(Font.title.weight(.bold))
                                .foregroundColor(Color.black)
                                .frame(width: 15, height: 15)
                        } else {
                            Image(systemName: "square.grid.2x2")
                                .resizable()
                                .foregroundColor(Color.gray)
                                .frame(width: 15, height: 15)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width / 2, height: 20)
                }
                
                Button(action: {
                    self.screen = 1
                }) {
                    VStack {
                        if self.screen == 1 {
                            Image(systemName: "person")
                                .resizable()
                                .font(Font.title.weight(.bold))
                                .foregroundColor(Color.black)
                                .frame(width: 15, height: 15)
                        } else {
                            Image(systemName: "person")
                                .resizable()
                                .foregroundColor(Color.gray)
                                .frame(width: 15, height: 15)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width / 2, height: 20)
                }
            }
            
            Divider()
        }
    }
}

struct UserDetailTabBar_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailTabBar(screen: .constant(0))
    }
}
