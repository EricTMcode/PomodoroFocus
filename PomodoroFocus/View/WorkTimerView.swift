//
//  WorkTimerView.swift
//  PomodoroFocus
//
//  Created by Eric on 26/02/2024.
//

import SwiftUI

struct WorkTimerView: View {
    @ObservedObject var viewModel = ViewModel()
    @State private var tapped = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea(edges: .all)
            VStack {
                Spacer()
                Text(viewModel.secondsToMinutesAndSeconds(viewModel.workTimeRemaining))
                    .font(.system(size: 90))
                    .foregroundStyle(.white)
                
                Spacer()
                
                HStack(alignment: .center, spacing: 50) {
                    if viewModel.workTimerMode == .running || viewModel.workTimerMode == .paused {
                        
                        Button {
                            viewModel.resetTimers()
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundStyle(.white)
                                .bold()
                                .font(.system(size: 20))
                        }
                    }
                    
                    Button {
                        if viewModel.workTimerMode == .running {
                            viewModel.pauseTimers()
                            tapped.toggle()
                        } else {
                            viewModel.startWorkTimer()
                            tapped.toggle()
                        }
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: 70, height: 70)
                                .foregroundStyle(.purpleTheme)
                            Image(systemName: viewModel.workTimerMode == .running ? "pause.fill" : "play.fill")
                                .foregroundStyle(.black)
                                .font(.system(size: 34))
                        }
                    }
                    if viewModel.workTimerMode == .running || viewModel.workTimerMode == .paused {
                        Button {
                            viewModel.advanceOneMinutesForward()
                        } label: {
                            Image(systemName: "goforward")
                                .foregroundStyle(.white)
                                .fontWeight(.heavy)
                                .rotationEffect(.degrees(60))
                                .font(.system(size: 20))
                        }
                    }
                }
                
                .padding(.bottom, 50)
            }
        }
    }
}

#Preview {
    WorkTimerView()
}
