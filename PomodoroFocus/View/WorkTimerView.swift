//
//  WorkTimerView.swift
//  PomodoroFocus
//
//  Created by Eric on 26/02/2024.
//

import SwiftUI

struct WorkTimerView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea(edges: .all)
            VStack {
                Spacer()
                Text("25.00")
                    .font(.system(size: 90))
                    .foregroundStyle(.white)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(.white)
                        .bold()
                        .font(.system(size: 20))
                }
            }
            .padding(.bottom, 50)
        }
    }
}

#Preview {
    WorkTimerView()
}
