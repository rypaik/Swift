//: [Previous](@previous)




import Foundation
import SwiftUI
import PlaygroundSupport
import SFSymbols
// Add SFSymbols to Playground

struct MenuView: View {
    var body: some View {
        Text("Playground Snippets Starter")
        // TODO: test in playgrounds


        //struct EnumView: View {
        //
        //    var selected = "Monday"
        //
        //    enum Weekday {
        ////        case monday
        ////        case tuesday
        ////        case wednesday
        ////        case thursday
        ////        case friday
        //        case monday, tuesday, wednesday, thursday, friday
        //    }
        //
        //    var day = Weekday.monday
        //    day = .tuesday
        //    day = .wednesday
        //    var body: some View {
        //            Text("\(day)")
        //    }
        //}




        // Simple Example
        enum WeatherType {
            case sunny, cloudy, rainy, windy(speed: Int), snowy
        }

        func getWeatherStatus(weather: WeatherType) -> String? {
            switch weather {
            case .sunny:
                return "Sun Image"
            case .cloudy:
                return "Cloud Image"
            case .rainy:
                return "Rainy Cloud Image"
            case .windy(let speed) where speed < 10:
                return "Little Windy Cloud Image"
            case .windy:
                return "Windy Cloud Image"
            case .snowy:
                return "Snowflake Image"
            }
        }


        getWeatherStatus(weather:.windy(speed:5))


        // enums in more detail .rawvalue, associatedvalue, CaseIterable
        // -[ ] https://www.youtube.com/watch?v=CdBL7m1AeII&t=213s



        import SFSymbols
        // SF Symbols Example
        enum SFSymbols: Image {
            static let location     = UIImage(systemName: "mappin.and.ellipse")
            static let repos        = UIImage(systemName: "folder")
            static let gists        = UIImage(systemName: "text.alignleft")
            static let followers    = UIImage(systemName: "heart")
            static let following    = UIImage(systemName: "person.2")
        }


        func set (itemInfoType: ItemInfoType, withCount count: Int) {
            switch itemInfoType {
            case .repos:
                symbolImageView.image   = SFSymbols.repos
                titleLabel.text         = "Public Repos"
            case .gists:
                symbolImageView.image   = SFSymbols.gists
                titleLabel.text         = "Public Gists"
            case .followers:
                symbolImageView.image   = SFSymbols.followers
                titleLabel.text         = "Followers"
            case .following:
                symbolImageView.image   = SFSymbols.following
                titleLabel.text         = "Following"
            }
            countLabel.text             = String(count)
        }

    }
}
        

PlaygroundPage.current.setLiveView(MenuView())






//: [Next](@next)
