//
//  ContentView.swift
//  Memorize_v2
//
//  Created by Dheepthi Reddy Vangeti on 10/13/24.
//

import SwiftUI

struct ContentView: View {
    
    let vehicles = ["🚗", "🚌", "🏎️", "🚑", "🚒", "🛻", "🛴", "🛵", "🚂", "⛵️", "🛩️", "🚄", "🛺", "🚔", "🚠", "🚇"]
    let people = ["👶🏻", "👧🏻", "🧔🏻‍♂️", "👵🏻", "👩🏻‍⚕️", "🧑🏻‍⚕️", "👩🏻‍🏫", "🧑🏻‍🏫", "👩🏻‍💻", "🧑🏻‍💻", "👩🏻‍🔬", "🧑🏻‍🔬", "👸🏻", "🫅🏻", "👰🏻‍♀️", "🎅🏻"]
    let activity = ["🏋🏻‍♀️", "🤼‍♀️", "🤸🏻‍♀️", "⛹🏻‍♀️", "🤺", "🤾🏻‍♀️", "🏌🏻‍♀️", "🏇🏻", "🧘🏻‍♀️", "🏄🏻‍♀️", "🏊🏻‍♀️", "🤽🏻‍♀️", "🚣🏻‍♀️", "🧗🏻‍♀️", "🚵🏻‍♀️", "⛷️"]
    @State var emojis = ["🚗", "🚌", "🏎️", "🚑", "🚒", "🛻", "🛴", "🛵", "🚂", "⛵️", "🛩️", "🚄", "🛺", "🚔", "🚠", "🚇"]
    
    @State var cardCount: Int = 16
    
    var body: some View {
        VStack {
            Text("Memorize!").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
            ScrollView{
                cards
                Spacer()
            }
            HStack{
                vehicleTheme
                Spacer()
                peopleTheme
                Spacer()
                activityTheme
            }
            .imageScale(.medium)
            .font(.largeTitle)
            .padding()
        }
        .padding()
    }
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))]){
            ForEach(emojis[0..<cardCount], id: \.self){
                emoji in CardView(content: emoji)
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }.foregroundStyle(.orange)
    }
    
    var vehicleTheme: some View {
        Button(action: {
            emojis = vehicles.shuffled()
            cardCount = Int.random(in: 0..<vehicles.count)
        }, label: {
            VStack{
                Image(systemName: "car.fill")
                Text("Vehicles").font(.body)
            }
        })
    }
    
    var peopleTheme: some View {
        Button(action: {
            emojis = people.shuffled()
            cardCount = Int.random(in: 0..<people.count)
        }, label: {
            VStack{
                Image(systemName: "person.circle.fill")
                Text("People").font(.body)
            }
        })
    }
    
    var activityTheme: some View {
        Button(action: {
            emojis = activity.shuffled()
            cardCount = Int.random(in: 0..<activity.count)
        }, label: {
            VStack{
                Image(systemName: "dumbbell.fill")
                Text("Activity").font(.body)
            }
        })
    }
         
}

struct CardView: View{
    let content : String
    @State var isFaceUp = true
    
    var body: some View{
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            
            Group{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            
            base.fill().opacity(isFaceUp ? 0 : 1)
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
