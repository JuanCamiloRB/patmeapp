import Foundation

enum TabBarOptionEnum {
    case home, pets
    
    var name: String {
        switch self {
            case .home:
                return "Home"
            case .pets:
                return "Pets"
        }
    }
    
    var iconDisabled: String {
        switch self {
            case .home:
                return "home-disabled"
            case .pets:
                return "pet-disabled"
        }
    }
    
    var iconActive: String {
        switch self {
            case .home:
                return "home-colored"
            case .pets:
                return "pet-colored"
        }
    }
}
