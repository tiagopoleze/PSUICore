import SwiftUI
import DesignSystem

/// A view that displays a text field for OTP input.
public struct OTPTextFieldView<ActionButton: View> {
    @EnvironmentObject private var designSystem: DesignSystem
    @Binding private var otpText: String
    @FocusState private var isKeyboardShowing: Bool
    @State private var otpSize: Int
    
    private var size = CGSize(width: 45, height: 45)
    private var cornerRadius: CGFloat = 6
    
    private let button: ActionButton
    
    /// Initializes an OTPTextField with the specified parameters.
    /// - Parameters:
    ///   - otpText: A binding to the OTP text.
    ///   - otpSize: The size of the OTP.
    ///   - button: A closure that returns an ActionButton.
    public init(
        otpText: Binding<String>,
        otpSize: Int,
        @ViewBuilder button: () -> ActionButton
    ) {
        self._otpText = otpText
        self._otpSize = State(wrappedValue: otpSize)
        self.button = button()
    }
}

extension OTPTextFieldView: View {
    public var body: some View {
        VStack {
            HStack(spacing: 0) {
                ForEach(0..<otpSize, id: \.self) { index in
                    ZStack {
                        if otpText.count > index {
                            let startIndex = otpText.startIndex
                            let charIndex = otpText.index(startIndex, offsetBy: index)
                            let charToString = String(otpText[charIndex])
                            Text(charToString)
                        } else {
                            Text(" ")
                        }
                    }
                    .frame(width: size.width, height: size.height)
                    .background {
                        let status = (isKeyboardShowing && otpText.count == index)
                        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                            .stroke(status ? .black : .gray, lineWidth: status ? 1 : 0.5)
                            .animation(.easeInOut(duration: 0.2), value: status)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.bottom, designSystem.spacer.lg)
            .padding(.top, designSystem.spacer.md)
            .background {
                TextField("", text: $otpText.limit(otpSize))
#if os(iOS)
                    .keyboardType(.numberPad)
                    .textContentType(.oneTimeCode)
#elseif os(macOS)
                    .textContentType(NSTextContentType.oneTimeCode)
#endif
                    .frame(width: 1, height: 1)
                    .opacity(0.001)
#if os(iOS)
                    .blendMode(.screen)
#endif
                    .focused($isKeyboardShowing)
            }
            .contentShape(Rectangle())
            .onTapGesture {
                isKeyboardShowing.toggle()
            }

            button.disableWithOpacity(otpText.count < otpSize)

        }
        .padding(.all)
        .frame(maxHeight: .infinity, alignment: .top)
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                Button {
                    isKeyboardShowing.toggle()
                } label: {
                    Text("Done")
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
}

#if DEBUG
struct OTPTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        OTPTextFieldView(otpText: .constant("123456"), otpSize: 6) {
            PSButton(title: "Verify") {
                print("here")
            }
        }
        .environmentObject(DesignSystem.mock)
    }
}
#endif

#if os(macOS)
extension NSTextField {
    open override var focusRingType: NSFocusRingType {
        get { .none }
        set {}
    }
}
#endif
