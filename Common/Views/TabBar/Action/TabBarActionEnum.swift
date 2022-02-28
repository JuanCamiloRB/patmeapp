import Foundation

enum TabBarActionEnum {
    case diary, task, document
    
    var icon: String {
        switch self {
        case .diary:
            return "notes-diary"
        case .task:
            return "checkmark"
        case .document:
            return "common-document-text"
        }
    }
    
    var name: String {
        switch self {
        case .diary:
            return "Diary entry"
        case .task:
            return "Task"
        case .document:
            return "Document"
        }
    }
}
