//
//  SettingsSheet.swift
//  Calculator
//
//  Created by Austin Vesich on 6/4/23.
//

import SwiftUI

struct SettingsSheet: View {
    
    // MARK: - Declaring Variables
    @AppStorage("backgroundColor") var backgroundColor: String = Color("Background").asString()
    @AppStorage("showCommas") var showCommas: Bool = false
    @State var selectedBackgroundColor: Color = Color("Background")
    
    // MARK: - UI
    var body: some View {
        VStack(alignment: .center, spacing: 16.0) {
            // Pull Down Indicator
            RoundedRectangle(cornerRadius: 2.0)
                .foregroundColor(.black.opacity(0.5))
                .frame(width: 64.0, height: 4.0)
                .padding(.bottom, 48.0)
            
            // Controls
            ColorPicker(selection: $selectedBackgroundColor, supportsOpacity: false) {
                Text("**Background Color:**")
                    .foregroundColor(Color("Text"))
            }
            .onChange(of: selectedBackgroundColor) {
                backgroundColor = $0.asString()
            }
            Toggle(isOn: $showCommas) {
                Text("**Show Commas:**")
                    .foregroundColor(Color("Text"))
            }
            Spacer()
        }
        .padding(24.0)
        .background(backgroundColor.asColor(),
                    ignoresSafeAreaEdges: .all)
    }
}

struct SettingsSheet_Previews: PreviewProvider {
    static var previews: some View {
        SettingsSheet()
    }
}
