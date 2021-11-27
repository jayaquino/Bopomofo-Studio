//
//  ContentPreview.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr  on 7/23/21.
//

import SwiftUI

struct ContentPreview: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var contentOne : [String]
    @Binding var contentTwo : [String]
    
    
    var body: some View {

        ScrollView{
            HStack{
                VStack{
                    ForEach(contentOne, id: \.self){symbol in
                        Text(symbol)
                            .padding(2)
                            .font(.system(size: 9))
                    }
                    .frame(minHeight:75)
                    .frame(minWidth: 100)
                    .multilineTextAlignment(.center)
                }
                
                VStack{
                    ForEach(contentTwo, id: \.self){symbol in
                        Text(symbol)
                            .padding(2)
                            .font(.system(size: 10))
                    }
                    .frame(minHeight:75)
                    .frame(minWidth: 150)
                    .multilineTextAlignment(.center)
                }
            }
        }
    }
}

struct ContentPreview_Previews: PreviewProvider {
    
    @State static var contentOne = [""]
    @State static var contentTwo = [""]
    
    static var previews: some View {
        ContentPreview(contentOne:$contentOne, contentTwo:$contentTwo)
    }
}
