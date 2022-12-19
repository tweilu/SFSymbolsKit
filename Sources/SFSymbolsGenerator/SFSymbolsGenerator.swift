@main
public struct SFSymbolsGenerator {
    public private(set) var text = "Hello, World!"

    public static func main() {
        let tool = CodeGenerator()

        do {
            try tool.run()
        } catch {
            print("Whoops! An error occurred: \(error)")
        }
    }
}
