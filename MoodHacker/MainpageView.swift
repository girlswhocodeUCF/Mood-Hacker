import SwiftUI
import SwiftData


struct MainpageView: View {
    public enum Feeling: String, CaseIterable, Identifiable {
        case highEnergyUnpleasant = "High Energy Unpleasant"
        case highEnergyPleasant = "High Energy Pleasant"
        case lowEnergyUnpleasant = "Low Energy Unpleasant"
        case lowEnergyPleasant = "Low Energy Pleasant"
        
        var id: Self {self}
    }
    
    @State private var selectedFeeling: Feeling = .highEnergyUnpleasant
    @State private var recommendedActivities: [ActivityModel] = []

        var body: some View {
            VStack {
                mainPage(selectedFeeling: $selectedFeeling, recommendedActivities: $recommendedActivities)
            }
        }
}

//if u want to preview it without building, comment the other one out, then run this

struct MainpageView_Previews: PreviewProvider{
    static var previews: some View {
        MainpageView();
    }
}

struct mainPage: View{
    @Binding var selectedFeeling: MainpageView.Feeling
    @Binding var recommendedActivities: [ActivityModel]

    var body: some View{
        NavigationView{
    
            @State var username = "Gabby"
            let feelings = ["High Energy Unpleasant", "High Energy Pleasant", "Low Energy Unpleasant", "Low Energy Pleasant"]
            
            VStack{
                ZStack{
                    Color(red: 0.8745098039215686, green:0.7019607843137254, blue: 0.9372549019607843).edgesIgnoringSafeArea(.all)
                    
                    Color(hue: 0.785, saturation: 0.096, brightness: 0.996).edgesIgnoringSafeArea(.bottom)
                    
                    Circle().trim(from: 0.0, to: 0.50).position(x:215).frame(width: 430).foregroundColor(Color(red: 0.8745098039215686, green:0.7019607843137254, blue: 0.9372549019607843))
                    
                    Text("Welcome Back to")
                        .font(.custom("SometypeMono-Regular", size: 30))
                        .foregroundColor(.white)
                        .font(.title)
                        .multilineTextAlignment(.center) // Set font and size
                        .position(x: 250, y: 50)
                    
                    Text("Mood Hacker")
                        .font(.custom("SometypeMono-Regular", size: 30))
                        .foregroundColor(.white)
                        .font(.title)
                        .multilineTextAlignment(.center) // Set font and size
                        .position(x: 250, y: 90)
                    
                    Text("How are you feeling today, \(username)?")
                        .font(.custom("SometypeMono-Regular", size: 16))
                        .position(x: 250, y: 270)
                        .foregroundColor(.black)
                    
                    Picker("Feeling", selection: $selectedFeeling) {
                                        ForEach(MainpageView.Feeling.allCases) { feeling in
                                            Text(feeling.rawValue)
                                                .tag(feeling)
                                        }
                                    }
                    .pickerStyle(.wheel)
                    .frame(width: 300, height: 80)
                    .background(RoundedRectangle(cornerRadius:15)
                        .stroke(.purple))
                    .position(x: 250, y: 350)
                    
                }
                
                VStack {

                    Button(action: {
                                        let feelingString = selectedFeeling.rawValue.components(separatedBy: " ").first ?? ""
                                        let recommenderService = RecommenderService(for: feelingString)
                        self.recommendedActivities = recommenderService.getRecommendedActivities() ?? []
                                    }) {
                                        Text("Recommend Activities")
                                    }
                                    .font(.custom("SometypeMono-Regular", size: 16))
                                    .buttonStyle(.bordered)
                                    .tint(Color(hue: 0.898, saturation: 0.614, brightness: 0.86))
                                    .padding()
                    
                }
                
                HStack(alignment: .center, spacing : -10) {
                    HStack(spacing: 10) {
                        ForEach(recommendedActivities, id: \.self) { activity in
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(hue: 0.898, saturation: 0.614, brightness: 0.86))
                                .frame(width: 170, height: 150)
                                .overlay(
                                    VStack {
                                        Text(activity.name)
                                            .foregroundColor(.white)
                                            .font(.title2)
                                        Text(activity.description)
                                            .foregroundColor(.white)
                                            .font(.body)
                                    }
                                )
                                .padding()
                        }
                    }
                    
                }
                .frame(width: 500, height: 200)
                
                
                HStack(alignment: .bottom, spacing : -10) {
                    // navigation bar
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "calendar")
                            .font(.system(size: 40))
                            .foregroundColor(Color(red: 0.8509803921568627, green:0.8509803921568627, blue: 0.8509803921568627))
                            .padding()
                    }
                    
                    
                    Button(action: {}) {
                        Image(systemName: "ellipsis.message.fill")
                            .font(.system(size: 40))
                            .foregroundColor(Color(red: 0.47058823529411764, green:0.40784313725490196, blue: 0.6470588235294118))
                            .padding()
                    }
                    
                    
                    Button(action: {}) {
                        Image("Image")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                            .padding()
                    }
                    
                    NavigationLink(destination: profilePage()) {
                        Image(systemName: "gearshape.fill")
                            .font(.system(size: 40))
                            .foregroundColor(Color(red: 0.8509803921568627, green:0.8509803921568627, blue: 0.8509803921568627))
                            .padding()
                        
                    }
                    
                    
                    Button(action: {}) {
                        Image(systemName: "person.fill")
                            .font(.system(size: 40))
                            .foregroundColor(Color(red: 0.47058823529411764, green:0.40784313725490196, blue: 0.6470588235294118))
                            .padding()
                    }
                    
                    Spacer()
                }
                .frame(height:60)
                .background(Color(red: 0.82, green:0.6431372549019608, blue: 0.9019607843137255))
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.965, green: 0.9, blue: 0.996))
            .accentColor(Color.black)
            
            }
        //}
    }
}
