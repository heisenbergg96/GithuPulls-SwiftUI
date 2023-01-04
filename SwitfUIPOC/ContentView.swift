//
//  ContentView.swift
//  SwitfUIPOC
//
//  Created by Vikhyath Shetty on 06/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var vm = PullRequestViewModel()
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                                
                List(vm.pullRequest, id: \.self) { row in
                    
                    NavigationLink(destination: PRCell(pullRequest: row)) {
                        
                        PRCell(pullRequest: row)
                            .listRowInsets(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                            .cornerRadius(20)
                            .onAppear {
                                if vm.isLastRow(row: row) {
                                    vm.fetchPulls()
                                }
                                
                            }
                    }.foregroundColor(Color.black)
                }.onAppear {
                    vm.fetchPulls()
                }.onDisappear {
                    print("aaa")
                }
                .listStyle(PlainListStyle())
            }.navigationTitle("Airbnb PRs")
            
           
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}

struct PRCell: View {
    
    let pullRequest: PullRequest
    
    var body: some View {
        
        ZStack {
            
            Color.black
            
            HStack(alignment: .top) {
                                
                AsyncImage(url: URL(string: pullRequest.user.avatarURL)) { image in
                    image
                        .resizable()
                        .frame(width: 40, height: 40)
                        .scaledToFill()
                        .cornerRadius(20)
                } placeholder: {
                    Color.purple.opacity(0.1)
                }.frame(width: 40, height: 40)
                    .cornerRadius(20)
                
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text(pullRequest.user.login)
                        .foregroundColor(.white)
                        .font(Font.system(size: 18))
                        .fontWeight(.semibold)
                    
                    Text(pullRequest.title)
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                        .lineSpacing(3)
                        .font(Font.system(size: 14))
                    
                    Text("Created on \(pullRequest.createdOn)")
                        .foregroundColor(Color.gray)
                        .fontWeight(.light)
                        .font(Font.system(size: 12))
                    
                    
                    Text("Closed on \(pullRequest.closedOn)")
                        .foregroundColor(Color.gray)
                        .fontWeight(.light)
                        .font(Font.system(size: 12))
                }
            }.padding()
                .listRowBackground(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                    .foregroundColor(.black)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                )

        }
            
                    
        
    }
}

struct ProfileScreen: View {
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            Color.white
            
            VStack {
                HeaderCell()
                List(0..<2) { row in
                                    
                    if row == 0 {
                        ProfileInfoCell()
                            .padding(.top, 30)
                    }
                    
                    if row == 1 {
                        VStack(alignment: .leading) {
                            Text("All posts")
                            StroyGrid()
                        }
                           
                    }
                }.listStyle(PlainListStyle())
                    .foregroundColor(.clear)
            }
        }
        
        
    }
}

struct HeaderCell: View {
    
    var body: some View {
        
        VStack(alignment: .trailing, spacing: 8) {
            
            HStack {
                
                Button {
                    print("Bell Tapped")
                } label: {
                    Image("bellIcon")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
                
                Spacer()
                
                Text("@vikhyath")
                    .fontWeight(.semibold)
                    .font(Font.system(size: 15))
                
                Spacer()
                
                Button {
                    print("settings Tapped")
                } label: {
                    Image("settings")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
            }
            .padding()
            .background(Color.purple)
                        
            Button {
                print("Edit button")
            } label: {
                
                HStack(spacing: 3) {
                    Text("Edit Profile")
                        .font(Font.system(size: 12))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Image("edit")
                        .resizable()
                        .frame(width: 14, height: 14)
                }.padding(EdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 5))
            }

        }
        
    
    }
}


struct ProfileInfoCell: View {
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            Color.green
            
            VStack(alignment: .center, spacing: 8) {
                
                Image("cap")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .offset(y: -30)
                    .padding(.bottom, -30)
                
                Text("Vikhyath")
                    .fontWeight(.bold)
                    .font(Font.system(size: 18))
                    .foregroundColor(.black)
                
                HStack(spacing: 16) {
                    
                    FollowInfo()
                    
                    FollowInfo()
                                        
                }.padding(.bottom , 8)
                
                ProfileButtonStack()
            }
        }.overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.clear)
                .foregroundColor(.white)
        )
    }
}

struct FollowInfo: View {
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 4) {
            
            Text("1220")
                .fontWeight(.semibold)
                .font(Font.system(size: 14))
                .foregroundColor(.black)
            
            Text("Followers")
                .fontWeight(.regular)
                .font(Font.system(size: 12))
                .foregroundColor(.black)
        }
    }
}

struct ProfileButtonStack: View {
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 0) {
            
            LargeButton(title: "View Rewards", backgroundColor: Color.clear) {
                
                print("View rewards")
            }
            
            LargeButton(title: "Share Profile", backgroundColor: Color.clear) {
                
                print("Share Profile")
            }
            
        }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
    }
}

struct ProfileButton: View {
    
    var body: some View {
        
        Button(action: {
            print("View Rewards")
        }) {
            HStack(spacing: 0) {
                Image("settings")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.purple)
                Text("View Rewards")
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
                    .padding()
                    .foregroundColor(.purple)
                
                    
            }.overlay(
                
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.purple, lineWidth: 2)
            )
            .padding(EdgeInsets())
            
        }
        .background(Color.white) // If you have this
        .cornerRadius(25)
    }
}

struct LargeButtonStyle: ButtonStyle {
    
    let backgroundColor: Color
    let foregroundColor: Color
    let isDisabled: Bool
    
    func makeBody(configuration: Self.Configuration) -> some View {
        let currentForegroundColor = isDisabled || configuration.isPressed ? foregroundColor.opacity(0.3) : foregroundColor
        return configuration.label
            .padding()
            .frame(height: 36)
            .foregroundColor(currentForegroundColor)
            .background(isDisabled || configuration.isPressed ? backgroundColor.opacity(0.3) : backgroundColor)
            // This is the key part, we are using both an overlay as well as cornerRadius
            .cornerRadius(6)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.purple, lineWidth: 1)
                    
        )
            .padding([.top, .bottom], 10)
            .font(Font.system(size: 19, weight: .semibold))
    }
}

struct LargeButton: View {
    
    private static let buttonHorizontalMargins: CGFloat = 20
    
    var backgroundColor: Color
    var foregroundColor: Color
    
    private let title: String
    private let action: () -> Void
    
    // It would be nice to make this into a binding.
    private let disabled: Bool
    
    init(title: String,
         disabled: Bool = false,
         backgroundColor: Color = Color.green,
         foregroundColor: Color = Color.white,
         action: @escaping () -> Void) {
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.title = title
        self.action = action
        self.disabled = disabled
    }
    
    var body: some View {
        HStack {
            Button(action:self.action) {
                
                HStack {
                    
                    Image("settings")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.purple)
                    
                    Text(self.title)
                        .fontWeight(.semibold)
                        .font(Font.system(size: 12))
                        .frame(maxWidth:.infinity)
                        .foregroundColor(.purple)
                }
                
                
            }
            .buttonStyle(LargeButtonStyle(backgroundColor: backgroundColor,
                                          foregroundColor: foregroundColor,
                                          isDisabled: disabled))
                .disabled(self.disabled)
        }.padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 9))
    }
}


struct StroyGrid: View {
    
    let data = (1...100).map { "Item \($0)" }
    
    let columns = [
        GridItem(.adaptive(minimum: UIScreen.main.bounds.width / 4))
    ]
    
    let numberColumn = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
//        ZStack {
            
//            Color.red
            
//            ScrollView {
                LazyVGrid(columns: numberColumn, spacing: 8) {
                    ForEach(data, id: \.self) { item in
                        ZStack {
                            Image("cap")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width / 4  - 16, height: UIScreen.main.bounds.width / 4 - 16)
                                .foregroundColor(.green)
                        }
                    }
                    
                    
                }
//        }
        

    }
    
    
}
