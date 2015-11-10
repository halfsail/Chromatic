import QtQuick 2.4
import Ubuntu.Components 1.2
import "components"

MainView {
    width: units.gu(45)
    height: units.gu(75)
    applicationName: "palette.kevinfeyder"
    backgroundColor: "white"

    PageStack {
        id: stack
    }

    Component {
        id: home
        Home {
            onHelpClicked: stack.push(help);
            onPlayClicked: stack.push(game);
        }
    }

    Component {
        id: game
        GamePage {}
    }

    Component {
        id: help
        Help {}
    }
    CreditsPage{
        id:credits
    }

    Component.onCompleted: stack.push(home);
}
