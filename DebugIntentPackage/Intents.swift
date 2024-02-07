import AppIntents
import Foundation
import IntentPackage

struct LibraryAppShortcuts: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: OpenShelf(),
            phrases: ["Open shelf in \(.applicationName)"],
            shortTitle: "abc",
            systemImageName: "books.vertical.fill"
        )
    }
}

extension Shelf: AppEnum {
    public static var typeDisplayRepresentation: TypeDisplayRepresentation = "Shelf"

    public static var caseDisplayRepresentations: [Shelf: DisplayRepresentation] = [
        .currentlyReading: "Currently Reading",
        .wantToRead: "Want to Read",
        .read: "Read",
    ]
}

struct OpenShelf: AppIntent {
    static var title: LocalizedStringResource = "Open Shelf"

    @Parameter(title: "Shelf")
    var shelf: Shelf

    @MainActor
    func perform() async throws -> some IntentResult {
//        Navigator.shared.openShelf(shelf)
        print("Opening \(shelf.rawValue)")
        return .result()
    }

    static var parameterSummary: some ParameterSummary {
        Summary("Open \(\.$shelf)")
    }

    static var openAppWhenRun: Bool = true
}
