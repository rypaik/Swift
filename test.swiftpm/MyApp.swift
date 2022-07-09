import SwiftUI


struct MenuView: View {
    var body: some View {
        ContentView()
    }
}

//
//struct CustomNavView: View {
//    var body: some View {
//        RedOneView()
//    }
//}
//
//
//struct RedOneView: View {
//    var body: some View {
//        NavigationView {
//            VStack{
//                CircleNumberView(color: .red, number: 1)
//                    .navigationTitle("Screen 1 Red")
//                    .offset(y: -60)
//
//                NavigationLink(destination: BlueTwoView(color: .orange), label: { Text("Next Screen")
//                        .bold()
//                        .frame(width: 280, height: 50)
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//
//                })
//            }
//        }
//    }
//}
//
//struct BlueTwoView: View {
//    var color: Color
//
//    var body: some View {
//        VStack{
//            CircleNumberView(color: color, number: 2)
//                .navigationTitle("Screen 2 Blue")
//                .offset(y: -60)
//
//            NavigationLink(destination: Text("Destination"), label: {
//                    Text("Next Screen")
//                        .bold()
//                        .frame(width: 200, height: 50)
//                        .background(Color.green)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//
//            })
//        }
//    }
//}
//
//
//struct CircleNumberView : View {
//    var color : Color
//    var number: Int
//    var body: some View {
//        ZStack {
//            Circle()
//                .frame(width: 200, height: 200)
//                .foregroundColor(color)
//            Text("\(number)")
//                .foregroundColor(.white)
//                .font(.system(size: 70, weight: .bold))
//        }
//    }
//}
//
//
//struct CustomNavView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomNavView()
//    }
//}
