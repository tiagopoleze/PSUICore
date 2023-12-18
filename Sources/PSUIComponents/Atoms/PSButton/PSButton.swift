import SwiftUI
import DesignSystem

public struct PSButton: View {
    @EnvironmentObject private var designSystem: DesignSystem

    private let title: String
    private let image: Image?
    private let style: PSButtonStyle
    private let cornerRadius: CGFloat?
    private let buttonSize: PSButtonSize
    @Binding private var loading: Bool
    @Binding private var disable: Bool
    private let action: (@Sendable () async -> Void)?

    public init(
        title: String,
        image: Image? = nil,
        style: PSButtonStyle = .primary,
        buttonSize: PSButtonSize = .medium,
        cornerRadius: CGFloat? = nil,
        loading: Binding<Bool> = .constant(false),
        disable: Binding<Bool> = .constant(false),
        action: (@Sendable () async -> Void)? = nil
    ) {
        self.action = action
        self.title = title
        self.image = image
        self.cornerRadius = cornerRadius
        self._loading = loading
        self._disable = disable
        self.style = style
        self.buttonSize = buttonSize
    }

    public var body: some View {
        GeometryReader {
            let size = $0.size
            label
                .background {
                    style.background(
                        designSystem: designSystem,
                        cornerRadius: cornerRadiusUsed,
                        disable: $disable
                    )
                    .frame(width: size.width, height: size.height)
                }
                .frame(width: size.width, height: size.height)
                .disabled(isDisabled)
                .accessibilityLabel(Text(title))
                .onTapGesture(perform: buttonAction)
        }
    }

    var label: some View {
        Group {
            if loading {
                ProgressView()
                    .controlSize(buttonSize.controleSize)
                    .foregroundStyle(style.tintColor(designSystem: designSystem, disable: $disable))
            } else {
                Label {
                    Text(title)
                } icon: {
                    if let image { image } else { EmptyView() }
                }
                .font(buttonSize.font)
                .foregroundColor(style.tintColor(designSystem: designSystem, disable: $disable))
            }
        }
    }

    private func buttonAction() {
        loading = true
        Task {
            await action?()
            loading = false
        }
    }

    private var isDisabled: Bool { disable || loading }

    private var cornerRadiusUsed: CGFloat {
        if let cornerRadius { return cornerRadius }
        return 8
    }
}

@available(iOS 15.0, macOS 12.0, *)
// MARK: - Previews
// swiftlint:disable:next type_body_length
struct PSButton_Previews: PreviewProvider {
    static var previews: some View {
        // swiftlint:disable:next closure_body_length
        HStack(alignment: .firstTextBaseline, spacing: 10) {
            VStack(alignment: .leading) {
                PSButton(
                    title: "Primary",
                    image: Image(systemName: "iphone")
                )
                PSButton(
                    title: "Primary",
                    image: Image(systemName: "iphone"),
                    loading: .constant(true)
                )
                PSButton(
                    title: "Primary",
                    image: Image(systemName: "iphone"),
                    disable: .constant(true)
                )
            }
            VStack(alignment: .leading) {
                PSButton(
                    title: "Secondary",
                    image: Image(systemName: "iphone"),
                    style: .secondary
                )
                PSButton(
                    title: "Secondary",
                    image: Image(systemName: "iphone"),
                    style: .secondary,
                    loading: .constant(true)
                )
                PSButton(
                    title: "Secondary",
                    image: Image(systemName: "iphone"),
                    style: .secondary,
                    disable: .constant(true)
                )
            }
            VStack(alignment: .leading) {
                PSButton(
                    title: "Tertiary",
                    image: Image(systemName: "iphone"),
                    style: .tertiary
                )
                PSButton(
                    title: "Tertiary",
                    image: Image(systemName: "iphone"),
                    style: .tertiary,
                    loading: .constant(true)
                )
                PSButton(
                    title: "Tertiary",
                    image: Image(systemName: "iphone"),
                    style: .tertiary,
                    disable: .constant(true)
                )
            }
            VStack(alignment: .leading) {
                PSButton(
                    title: "Success",
                    image: Image(systemName: "iphone"),
                    style: .success
                )
                PSButton(
                    title: "Success",
                    image: Image(systemName: "iphone"),
                    style: .success,
                    loading: .constant(true)
                )
                PSButton(
                    title: "Success",
                    image: Image(systemName: "iphone"),
                    style: .success,
                    disable: .constant(true)
                )
            }
            VStack(alignment: .leading) {
                PSButton(
                    title: "Danger",
                    image: Image(systemName: "iphone"),
                    style: .danger
                )
                PSButton(
                    title: "Danger",
                    image: Image(systemName: "iphone"),
                    style: .danger,
                    loading: .constant(true)
                )
                PSButton(
                    title: "Danger",
                    image: Image(systemName: "iphone"),
                    style: .danger,
                    disable: .constant(true)
                )
            }
        }
        .padding()
        .environmentObject(DesignSystem.mock)

        // swiftlint:disable:next closure_body_length
        HStack(alignment: .firstTextBaseline, spacing: 10) {
            VStack(alignment: .leading) {
                PSButton(
                    title: "Primary",
                    image: Image(systemName: "iphone")
                )
                PSButton(
                    title: "Primary",
                    image: Image(systemName: "iphone"),
                    loading: .constant(true)
                )
                PSButton(
                    title: "Primary",
                    image: Image(systemName: "iphone"),
                    disable: .constant(true)
                )
            }
            VStack(alignment: .leading) {
                PSButton(
                    title: "Secondary",
                    image: Image(systemName: "iphone"),
                    style: .secondary
                )
                PSButton(
                    title: "Secondary",
                    image: Image(systemName: "iphone"),
                    style: .secondary,
                    loading: .constant(true)
                )
                PSButton(
                    title: "Secondary",
                    image: Image(systemName: "iphone"),
                    style: .secondary,
                    disable: .constant(true)
                )
            }
            VStack(alignment: .leading) {
                PSButton(
                    title: "Tertiary",
                    image: Image(systemName: "iphone"),
                    style: .tertiary
                )
                PSButton(
                    title: "Tertiary",
                    image: Image(systemName: "iphone"),
                    style: .tertiary,
                    loading: .constant(true)
                )
                PSButton(
                    title: "Tertiary",
                    image: Image(systemName: "iphone"),
                    style: .tertiary,
                    disable: .constant(true)
                )
            }

            VStack(alignment: .leading) {
                PSButton(
                    title: "Success",
                    image: Image(systemName: "iphone"),
                    style: .success
                )
                PSButton(
                    title: "Success",
                    image: Image(systemName: "iphone"),
                    style: .success,
                    loading: .constant(true)
                )
                PSButton(
                    title: "Success",
                    image: Image(systemName: "iphone"),
                    style: .success,
                    disable: .constant(true)
                )
            }
            VStack(alignment: .leading) {
                PSButton(
                    title: "Danger",
                    image: Image(systemName: "iphone"),
                    style: .danger
                )
                PSButton(
                    title: "Danger",
                    image: Image(systemName: "iphone"),
                    style: .danger,
                    loading: .constant(true)
                )
                PSButton(
                    title: "Danger",
                    image: Image(systemName: "iphone"),
                    style: .danger,
                    disable: .constant(true)
                )
            }
        }
        .preferredColorScheme(.dark)
        .padding()
        .environmentObject(DesignSystem.mock)

        // swiftlint:disable:next closure_body_length
        HStack(alignment: .firstTextBaseline, spacing: 10) {
            VStack(alignment: .leading) {
                PSButton(
                    title: "Primary",
                    image: Image(systemName: "iphone"),
                    buttonSize: .small
                )
                PSButton(
                    title: "Primary",
                    image: Image(systemName: "iphone"),
                    buttonSize: .small,
                    loading: .constant(true)
                )
                PSButton(
                    title: "Primary",
                    image: Image(systemName: "iphone"),
                    buttonSize: .small,
                    disable: .constant(true)
                )
            }
            VStack(alignment: .leading) {
                PSButton(
                    title: "Secondary",
                    image: Image(systemName: "iphone"),
                    style: .secondary,
                    buttonSize: .small
                )
                PSButton(
                    title: "Secondary",
                    image: Image(systemName: "iphone"),
                    style: .secondary,
                    buttonSize: .small,
                    loading: .constant(true)
                )
                PSButton(
                    title: "Secondary",
                    image: Image(systemName: "iphone"),
                    style: .secondary,
                    buttonSize: .small,
                    disable: .constant(true)
                )
            }
            VStack(alignment: .leading) {
                PSButton(
                    title: "Tertiary",
                    image: Image(systemName: "iphone"),
                    style: .tertiary,
                    buttonSize: .small
                )
                PSButton(
                    title: "Tertiary",
                    image: Image(systemName: "iphone"),
                    style: .tertiary,
                    buttonSize: .small,
                    loading: .constant(true)
                )
                PSButton(
                    title: "Tertiary",
                    image: Image(systemName: "iphone"),
                    style: .tertiary,
                    buttonSize: .small,
                    disable: .constant(true)
                )
            }

            VStack(alignment: .leading) {
                PSButton(
                    title: "Success",
                    image: Image(systemName: "iphone"),
                    style: .success,
                    buttonSize: .small
                )
                PSButton(
                    title: "Success",
                    image: Image(systemName: "iphone"),
                    style: .success,
                    buttonSize: .small,
                    loading: .constant(true)
                )
                PSButton(
                    title: "Success",
                    image: Image(systemName: "iphone"),
                    style: .success,
                    buttonSize: .small,
                    disable: .constant(true)
                )
            }
            VStack(alignment: .leading) {
                PSButton(
                    title: "Danger",
                    image: Image(systemName: "iphone"),
                    style: .danger,
                    buttonSize: .small
                )
                PSButton(
                    title: "Danger",
                    image: Image(systemName: "iphone"),
                    style: .danger,
                    buttonSize: .small,
                    loading: .constant(true)
                )
                PSButton(
                    title: "Danger",
                    image: Image(systemName: "iphone"),
                    style: .danger,
                    buttonSize: .small,
                    disable: .constant(true)
                )
            }
        }
        .padding()
        .environmentObject(DesignSystem.mock)

        // swiftlint:disable:next closure_body_length
        HStack(alignment: .firstTextBaseline, spacing: 10) {
            VStack(alignment: .leading) {
                PSButton(
                    title: "Primary",
                    image: Image(systemName: "iphone"),
                    buttonSize: .small
                )
                PSButton(
                    title: "Primary",
                    image: Image(systemName: "iphone"),
                    buttonSize: .small,
                    loading: .constant(true)
                )
                PSButton(
                    title: "Primary",
                    image: Image(systemName: "iphone"),
                    buttonSize: .small,
                    disable: .constant(true)
                )
            }
            VStack(alignment: .leading) {
                PSButton(
                    title: "Secondary",
                    image: Image(systemName: "iphone"),
                    style: .secondary,
                    buttonSize: .small
                )
                PSButton(
                    title: "Secondary",
                    image: Image(systemName: "iphone"),
                    style: .secondary,
                    buttonSize: .small,
                    loading: .constant(true)
                )
                PSButton(
                    title: "Secondary",
                    image: Image(systemName: "iphone"),
                    style: .secondary,
                    buttonSize: .small,
                    disable: .constant(true)
                )
            }
            VStack(alignment: .leading) {
                PSButton(
                    title: "Tertiary",
                    image: Image(systemName: "iphone"),
                    style: .tertiary,
                    buttonSize: .small
                )
                PSButton(
                    title: "Tertiary",
                    image: Image(systemName: "iphone"),
                    style: .tertiary,
                    buttonSize: .small,
                    loading: .constant(true)
                )
                PSButton(
                    title: "Tertiary",
                    image: Image(systemName: "iphone"),
                    style: .tertiary,
                    buttonSize: .small,
                    disable: .constant(true)
                )
            }
            VStack(alignment: .leading) {
                PSButton(
                    title: "Success",
                    image: Image(systemName: "iphone"),
                    style: .success,
                    buttonSize: .small
                )
                PSButton(
                    title: "Success",
                    image: Image(systemName: "iphone"),
                    style: .success,
                    buttonSize: .small,
                    loading: .constant(true)
                )
                PSButton(
                    title: "Success",
                    image: Image(systemName: "iphone"),
                    style: .success,
                    buttonSize: .small,
                    disable: .constant(true)
                )
            }
            VStack(alignment: .leading) {
                PSButton(
                    title: "Danger",
                    image: Image(systemName: "iphone"),
                    style: .danger,
                    buttonSize: .small
                )
                PSButton(
                    title: "Danger",
                    image: Image(systemName: "iphone"),
                    style: .danger,
                    buttonSize: .small,
                    loading: .constant(true)
                )
                PSButton(
                    title: "Danger",
                    image: Image(systemName: "iphone"),
                    style: .danger,
                    buttonSize: .small,
                    disable: .constant(true)
                )
            }
        }
        .preferredColorScheme(.dark)
        .padding()
        .environmentObject(DesignSystem.mock)
    }
}
