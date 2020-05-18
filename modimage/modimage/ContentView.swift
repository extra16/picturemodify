//
//  ContentView.swift
//  modimage
//
//  Created by Lab i on 2020/5/12.
//  Copyright © 2020 Jason. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var scale: CGFloat = 1
    @State private var bright: Double = 0
    @State private var red: Double = 0
    @State private var green: Double = 0
    @State private var blue: Double = 1
    @State private var rotate: Double = 0
    @State private var border: CGFloat = 0
    @State private var corner: CGFloat = 0
    
    @State private var untoggle1: Double=0
    @State private var untoggle2: Double=0
    @State private var untoggle3: Double=0
    @State private var untoggle4: Double=0
    @State private var untoggle5: Double=0
    @State private var untoggle6: Double=0
    @State private var untoggle7: Double=0
    @State private var untoggle8: Double=0
    
    @State private var toggle1 = true
    @State private var toggle2 = true
    @State private var toggle3 = true
    @State private var toggle4 = true
    @State private var toggle5 = true
    @State private var toggle6 = true
    @State private var toggle7 = true
    @State private var toggle8 = true
    
    @State private var showAlert = false
    
    var pics = ["多拉Ａ夢", "Hello Kitty", "Mickey", "蛋黃哥"]

    
    @State private var selectedIndex = 0
    
    var body: some View {
        VStack {
           // Color(red: red, green: 0, blue: 0)
                   Image(pics[selectedIndex])
                       .resizable()
                    //.padding()
                    .scaledToFill()
                    .frame(width: 300, height:300)
                       //.clipped()
                       .brightness(bright)
                    .background(Color(red:red, green:green,blue:blue))
            .rotationEffect(Angle(degrees: rotate))
                    .border(Color.green, width: border)
            .cornerRadius(corner)
                    .shadow(radius:10)
                    .scaleEffect(scale)
            HStack{
                Picker(selection: $selectedIndex, label: Text("")) {
                   Text(self.pics[0]).tag(0)
                   Text(self.pics[1]).tag(1)
                   Text(self.pics[2]).tag(2)
                   Text(self.pics[3]).tag(3)
//                    ForEach(0..<4) { (index) in
//                        Text(self.pics[index])
//                       Image("ding")
//                    }
                }
                    
        .pickerStyle(SegmentedPickerStyle())
            }
          
                    
            HStack{
                Toggle("縮放",isOn: $toggle1)
                    .frame(width: 100)
                
                if toggle1{
                    Slider(value:$scale, in:0...1)
                }
                else{
                    Slider(value:$untoggle1, in:0...0)
                    
                }
                  
            }
              
                
            
          HStack{
                //Text("明亮")
               Toggle("明亮",isOn: $toggle2)
                .frame(width: 100)
            
            if toggle2{
                Slider(value:$bright, in:0...1)
            }
            else{
                Slider(value:$untoggle2, in:0...0)
                
            }
         
            
            }
            
            HStack{
                Toggle("紅",isOn: $toggle3)
                    .frame(width: 100)
                
                if toggle3{
                    Slider(value:$red, in:0...1)
                    .accentColor(.red)
                }
                else{
                    Slider(value:$untoggle3, in:0...0)
                }
               
              
            }
            
            HStack{
                Toggle("綠",isOn: $toggle4)
                .frame(width: 100)
                               
                if toggle4{
                    Slider(value:$green, in:0...1)
                    .accentColor(.green)
                            }
                else{
                    Slider(value:$untoggle4, in:0...0)
                            }
                
              


            }
            
            HStack{
               Toggle("藍",isOn: $toggle5)
                .frame(width: 100)
                               
                if toggle5{
                    Slider(value:$blue, in:0...1)
                    .accentColor(.blue)
                            }
                else{
                    Slider(value:$untoggle5, in:0...0)
                            }

            }
           
            HStack{
                Toggle("旋轉",isOn: $toggle6)
                .frame(width: 100)
                               
                if toggle6{
                    Slider(value:$rotate, in:0...720)
                            }
                else{
                    Slider(value:$untoggle6, in:0...0)
                            }
            
            }
          
            HStack{
                Toggle("邊框",isOn: $toggle7)
                .frame(width: 100)
                               
                if toggle7{
                    Slider(value:$border, in:0...5)
                            }
                else{
                    Slider(value:$untoggle7, in:0...0)
                            }
                
            }
    VStack{
            HStack{
                Toggle("圓角",isOn: $toggle8)
                .frame(width: 100)
                                              
                if toggle8{
                    Slider(value:$corner, in:0...200)
                            }
                else{
                   Slider(value:$untoggle4, in:0...0)
                            }
                              

                           }
        HStack{
        Button(action:{
            
            if self.toggle1{
                self.scale=CGFloat.random(in: 0...1)
            }
            if self.toggle2{
                self.bright=Double.random(in: 0...1)
            }
            if self.toggle3{
                self.red=Double.random(in: 0...1)
            }
            if self.toggle4{
                self.green=Double.random(in: 0...1)
            }
            if self.toggle5{
                self.blue=Double.random(in: 0...1)
            }
            if self.toggle6{
                 self.rotate=Double.random(in: 0...720)
            }
            if self.toggle7{
                 self.border=CGFloat.random(in: 0...5)
            }
            if self.toggle8{
                 self.corner = CGFloat.random(in: 0...200)
            }
                        
            
        })
                {
                    Text("隨機")
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .font(.title)
                    
            }
            Button(action: {
                self.showAlert = true
                
                
            }) {
                Text("Alert")
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .font(.title)
            }.alert(isPresented: $showAlert){()->Alert in let answer = ["吉","大吉","大吉大利"].randomElement()!
                return Alert(title: Text(answer), dismissButton: .cancel())
            }
        
        }
            }
           
                                
        }
    .padding()

    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
