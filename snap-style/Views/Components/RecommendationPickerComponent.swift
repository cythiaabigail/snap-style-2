//
//  RecommendationPickerComponent.swift
//  snap-style
//
//  Created by dary winata nugraha djati on 24/06/23.
//

import SwiftUI

struct RecommendationPickerComponent: View {
    
    @Binding var choosePicker : String
    let dataPickers : [String]

    var body: some View {
        Menu {
            Picker("Data Picker", selection: $choosePicker) {
                ForEach(dataPickers, id: \.self) { picker in
                    HStack {
                        Text(picker).foregroundColor(Color("secondary"))
                    }
                }
            }
        } label: {
            HStack {
                Text(choosePicker).foregroundColor(Color("secondary"))
                    .font(.system(size: 13))
                    .padding(.trailing, 15)
                Image("DropdownIcon")
            }.foregroundColor(.black)
        }
    }
}

struct RecommendationPickerComponent_Previews: PreviewProvider {
    
    @State static var choosePicker : String = "dummyPicker1"
    static var dataPickers : [String] = ["dummyPicker1", "dummyPicker2", "dummyPicker3"]
    
    static var previews: some View {
        RecommendationPickerComponent(choosePicker: $choosePicker, dataPickers: dataPickers)
    }
}
