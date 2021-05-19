//
//  Home.swift
//  UI-195
//
//  Created by にゃんにゃん丸 on 2021/05/19.
//

import SwiftUI

struct Home: View {
    @State var selected = "square.grid.3x3"
    @Namespace var animation
    
    @Environment(\.colorScheme) var scheme
    
    @State var topHeadoffset : CGFloat = 0
    var body: some View {
        VStack{
            
            
            HStack{
                
                Text("_IGANA")
                    .font(.title2)
                    .foregroundColor(.primary)
                    .fontWeight(.semibold)
                
                Spacer(minLength: 0)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.title2)
                        .foregroundColor(.primary)
                })
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "line.horizontal.3")
                        .font(.title2)
                        .foregroundColor(.primary)
                })
                
                
            }
            .padding([.top,.horizontal])
            .overlay(
            
                GeometryReader{proxy -> Color in
                    
                    
                    let minY = proxy.frame(in:.global).minY
                    
                    DispatchQueue.main.async {
                        if topHeadoffset == 0{
                            
                            topHeadoffset = minY
                        }
                    }
                    
                    return Color.clear
                    
                }
                .frame(width: 0, height: 0)
                ,alignment: .bottom
            
            )
            
            
            ScrollView(.vertical, showsIndicators: false, content: {
                
                
                VStack{
                    
                    Divider()
                    
                    
                    HStack{
                        
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image("logo")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 70, height: 70)
                                .clipShape(Circle())
                                .overlay(
                                  Image(systemName: "plus")
                                    .foregroundColor(.white)
                                        .padding(6)
                                        .background(Color.blue)
                                        .clipShape(Circle())
                                    .background(Color.white)
                                    .padding(2)
                                    .background(Color.white)
                                    .clipShape(Circle())
                                    .offset(x: 8, y: 5)
                                    ,alignment: .bottomTrailing
                                )
                        })
                        
                        VStack(spacing:3){
                            
                            
                            Text("200")
                                .font(.title2)
                                .foregroundColor(.primary)
                            
                            Text("Posts")
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth: .infinity)
                        
                        
                        VStack(spacing:3){
                            
                            
                            Text("16")
                                .font(.title2)
                                .foregroundColor(.primary)
                            
                            Text("Followers")
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth: .infinity)
                        
                        
                        VStack(spacing:3){
                            
                            
                            Text("15")
                                .font(.title2)
                                .foregroundColor(.primary)
                            
                            Text("Following")
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth: .infinity)
                        
                        
                        
                    }
                    .padding(.horizontal)
                    
                    
                    VStack(alignment:.leading,spacing:5){
                        
                        Text("Today is a gift")
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        
                        Text("Push up Close foot + 40")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        
                        Text("Age at 39 Evolution Never Stops")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        
                        
                        Link(destination: URL(string: "https://www.apple.com")!, label: {
                            Text("Apple.com")
                                .foregroundColor(.primary)
                        })
                        
                            
                        
                    }
                    .padding(.horizontal)
                    
                    
                    HStack{
                        
                        Text("Edite Profile")
                            .foregroundColor(.primary)
                            .padding(.vertical,10)
                            .padding(.horizontal,10)
                            .frame(maxWidth: .infinity)
                            .background(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.primary,lineWidth: 1)
                            
                            )
                        
                        Text("Promotions")
                            .foregroundColor(.primary)
                            .padding(.vertical,10)
                            .padding(.horizontal,10)
                            .frame(maxWidth: .infinity)
                            .background(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.primary,lineWidth: 1)
                            
                            )
                        
                    }
                    .padding([.horizontal,.top])
                    
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        HStack(spacing:15){
                            
                          
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                VStack{
                                    
                                    
                                    Image(systemName: "plus")
                                        .font(.title)
                                        .foregroundColor(.primary)
                                        .padding(20)
                                        .background(Circle().stroke(Color.green,lineWidth: 5))
                                    
                                    Text("Add")
                                        .foregroundColor(.primary)
                                    
                                }
                            })
                    
                              
                                    
                                   
                           
                            
                            
                        }
                        
                        .padding([.horizontal,.top])
                    })
                    
                    GeometryReader{proxy -> AnyView in
                        
                        let minY = proxy.frame(in: .global).minY
                        
                        let offset = minY - topHeadoffset
                        
                        return AnyView(
                            
                            HStack(spacing:0){
                                
                                
                                TabButton(selected: $selected, isystem: true, image: "square.grid.3x3", animation: animation)
                                
                                TabButton(selected: $selected, isystem: false, image: "reels", animation: animation)
                                
                                TabButton(selected: $selected, isystem: true, image: "figure.walk", animation: animation)
                                
                   
                            }
                            .frame(height: 70,alignment: .bottom)
                            .background(scheme == .dark ? Color.black : Color.white)
                            .offset(y: offset < 0 ? -offset : 0)
                          
                        
                        )
                    }
                    .frame(height: 70)
                    .zIndex(4)
                    
    
                    
                    ZStack{
                        
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing: 10), count: 2), spacing: 8, content: {
                            
                            
                            ForEach(1...39,id:\.self){index in
                                
                                GeometryReader{proxy in
                                    
                                    let width = proxy.frame(in:.global).width
                                    
                                   
                                    ImageView(index: index, width: width)
                                    
                                    
                                    
                                }
                                .frame(height: 120)
                                
                                
                                
                            }
                            
                           
                        })
                        .padding()
                    }
                    
                    
                }
            })
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct ImageView : View {
    var index : Int
    var width : CGFloat
        
    var body: some View{
        
        
        let imageName = index > 13 ? index - (13*(index/13)) == 0 ? 13 : index - (13*(index / 13)) : index
        
        Image("post\(imageName)")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: 120)
            .cornerRadius(0)
        
    }
    
    }


struct TabButton : View {
    @Binding var selected : String
    var isystem : Bool
    var image : String
    var animation : Namespace.ID
    
    var body: some View{
        
        
        Button(action: {
            
            withAnimation(.easeInOut){
                
                selected = image
            }
            
        }, label: {
            VStack{
                
                
                (
                
                    isystem ? Image(systemName: image) : Image(image)
                
                )
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 28, height: 28)
                .foregroundColor(selected == image ? .blue : .gray)
                
                
                ZStack{
                    
                    if selected == image{
                        
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.blue)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                        
                    }
                    
                    else{
                        
                        
                        Color.clear
                        
                    }
                }
                .frame(height: 1)
                
            }
        })
        
    }
}
