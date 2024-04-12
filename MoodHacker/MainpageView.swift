import SwiftUI
import SwiftData

struct MainpageView: View {
    var body: some View {
        mainPage()
    }
}


struct MainpageView_Previews: PreviewProvider{
    static var previews: some View {
        MainpageView()
    }
}

struct mainPage: View{
    var body: some View{
        @State var selectedFeeling = ""
        @State var username = "Gabby"
        let feelings = ["High Energy Unpleasant", "High Energy Pleasant", "Low Energy Unpleasant", "Low Energy Pleasant"]
        
        VStack{
            ZStack{
                Color(red: 0.7, green:0.4, blue: 1).edgesIgnoringSafeArea(.all)
                
                Color(hue: 0.785, saturation: 0.096, brightness: 0.996).edgesIgnoringSafeArea(.bottom)
                
                Circle().trim(from: 0.0, to: 0.50).position(x:215).frame(width: 430).foregroundColor(Color(red: 0.7, green:0.4, blue: 1))
                
                
            }
            
            VStack {
                Text("How are you feeling today, \(username)?")
                Picker("selector", selection: $selectedFeeling) {
                    ForEach(feelings, id: \.self) { feeling in
                        Text(feeling)
                    }
                }
                .pickerStyle(.wheel)
                .frame(width: 300, height: 80)
                .background(RoundedRectangle(cornerRadius:15)
                    .stroke(.purple))
                
                Button("Get Recommendations") {
                }
                    .buttonStyle(.bordered)
                    .tint(.purple)
                    .padding()
            }
            
            HStack {
                Text("Here's your personalized recommendations:")
                    .frame(width: 500, height: 100).padding()
                    .foregroundStyle(.gray)
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.785, saturation: 0.096, brightness: 0.996))
        .accentColor(Color.gray)
    }
}
