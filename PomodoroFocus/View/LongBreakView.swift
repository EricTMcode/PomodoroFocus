//
//  LongBreakView.swift
//  PomodoroFocus
//
//  Created by Eric on 29/02/2024.
//

import SwiftUI

struct LongBreakView: View {
    @ObservedObject var viewModel = ViewModel()
    @State private var tapped = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea(edges: .all)
            VStack {
                Spacer()
                Text(viewModel.secondsToMinutesAndSeconds(viewModel.longBreakTimeRemaining))
                    .font(.system(size: 90))
                    .foregroundStyle(.white)
                
                Spacer()
                
                HStack(alignment: .center, spacing: 50) {
                    if viewModel.longBreakTimerMode == .running || viewModel.longBreakTimerMode == .paused {
                        
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
                        if viewModel.longBreakTimerMode == .running {
                            viewModel.pauseTimers()
                            tapped.toggle()
                        } else {
                            viewModel.startLongBreakTimer()
                            tapped.toggle()
                        }
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: 70, height: 70)
                                .foregroundStyle(.purpleTheme)
                            Image(systemName: viewModel.longBreakTimerMode == .running ? "pause.fill" : "play.fill")
                                .foregroundStyle(.black)
                                .font(.system(size: 34))
                        }
                    }
                    if viewModel.longBreakTimerMode == .running || viewModel.longBreakTimerMode == .paused {
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
    LongBreakView()
}
