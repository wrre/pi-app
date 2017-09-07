import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2

ApplicationWindow {
	title: "startView";
	width: 400;
	height: 400;
	visible: true;

	StackView {
		id: stack;
		anchors.fill: parent;

		delegate: StackViewDelegate {
			pushTransition: StackViewTransition {
				SequentialAnimation{
					PropertyAnimation {
							target: exitItem
							property: "opacity"
							from: 1
							to: 0
							duration: 1000
					}

					PropertyAnimation {
							target: logo2
							property: "opacity"
							from: 0
							to: 1
							duration: 1000
					}

					PropertyAnimation {
							target: logo2
							property: "opacity"
							from: 1
							to: 0
							duration: 1000
					}

					PropertyAnimation {
							target: enterItem
							property: "opacity"
							from: 0
							to: 1
							duration: 1000
					}
				}
			}
		}

		Component.onCompleted: {
			onClicked: if(stack.depth == 0)stack.push(logo1);
		}

	}

	Component {
		id: logo1;

		Rectangle {
			Image {
				source: 'gina1.png';
				anchors.centerIn: parent;

				MouseArea {
					id: logo1_Mouse;
					anchors.fill: parent;
				  onClicked: {
						logo1_Mouse.enabled = false;
						stack.push(mic);
					}
			 }
			}
		}
	}

	Image {
		id: logo2;
		source: 'gina2.png';
		anchors.centerIn: parent;
		opacity: 0;
	}

	Component {
		id: mic;

		Rectangle {
			opacity: 0;
			Image {
				source: 'mic.png';
				anchors.bottom: parent.bottom;
				anchors.bottomMargin: 60;
				anchors.horizontalCenter: parent.horizontalCenter;
				width: 30;
				height: 50;

				MouseArea {
					anchors.fill: parent;
					onClicked: {
						console.log('click mic');
					}
				}
			}
		}
	}
}
