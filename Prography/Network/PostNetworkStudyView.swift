//
//  PostNetworkStudy.swift
//  Prography
//
//  Created by 박서연 on 2024/05/23.
//

import SwiftUI

struct PostNetworkStudyView: View {
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var status: Bool = true
    
    var body: some View {
        VStack(spacing: 30) {
            TextField("Title", text: $title)
                .padding(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.black, lineWidth: 1)
                }
            
            TextField("Description", text: $description)
                .padding(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.black, lineWidth: 1)
                }
            
            HStack {
                Text("private")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background(.pink)
                    .foregroundStyle(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .onTapGesture {
                        status = false
                    }

                
                Text("public")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background(.green)
                    .foregroundStyle(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .onTapGesture {
                        status = true
                    }
            }
            
            Button {
                print("Post!")
            } label: {
                Text("Create")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .foregroundStyle(Color.black)
                    .background(Color.yellow)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1)
                    }
            }
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    PostNetworkStudyView()
}
