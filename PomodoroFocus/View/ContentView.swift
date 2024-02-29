//
//  ContentView.swift
//  PomodoroFocus
//
//  Created by Eric on 26/02/2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    @State private var selectedTab = 0
    @State private var indicatorOffset: CGFloat = -3.5
    
    init() {
        _selectedTab = State(initialValue: 0)
        _indicatorOffset = State(initialValue: 0)
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        Spacer()
                        Text("Pomodoro")
                            .foregroundStyle(selectedTab == 0 ? .white : .gray)
                            .onTapGesture {
                                selectedTab = 0
                                indicatorOffset = UIScreen.main.bounds.width / -3.5
                            }
                        Spacer()
                        Text("Short Break")
                            .foregroundStyle(selectedTab == 1 ? .white : .gray)
                            .onTapGesture {
                                selectedTab = 1
                                indicatorOffset = 1
                            }
                        Spacer()
                        Text("Long Break")
                            .foregroundStyle(selectedTab == 2 ? .white : .gray)
                            .onTapGesture {
                                selectedTab = 2
                                indicatorOffset = UIScreen.main.bounds.width / 3.5
                            }
                        Spacer()
                    }
                    .font(.title3)
                    .bold()
                    .padding()
                    
                    Rectangle()
                        .fill(.purpleTheme)
                        .frame(width: UIScreen.main.bounds.width / 8, height: 2)
                        .offset(x: indicatorOffset, y: 0)
                    
                    TabView(selection: $selectedTab) {
                        WorkTimerView(viewModel: viewModel)
                            .tag(0)
                        
                        ShortTimerView(viewModel: viewModel)
                            .tag(1)
                        
                        LongBreakView(viewModel: viewModel)
                            .tag(2)
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                }
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    ContentView()
}
