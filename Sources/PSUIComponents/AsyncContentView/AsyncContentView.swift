//
//  AsyncContentView.swift
//  
//
//  Created by Tiago Ferreira on 28/04/2023.
//

import SwiftUI

/// The View that wrap the state
public struct AsyncContentView<Source: LoadableObject, Content: View>: View {
    @ObservedObject var source: Source
    var content: (Source.Output) -> Content

    @State private var first = true
    let retryHandler: (() -> Void)?

    public init(
        source: Source,
        @ViewBuilder content: @escaping (Source.Output) -> Content,
        retryHandler: (() -> Void)? = nil
    ) {
        self.source = source
        self.content = content
        self.retryHandler = retryHandler
    }

    public var body: some View {
        switch source.state {
        case .idle:
            Color.clear.onAppear(perform: source.load)
        case .loading:
            ProgressView()
        case .failed(let error):
            AsyncErrorView(error: error, retryHandler: first ? source.load : retryHandler)
                .onAppear { first.toggle() }
        case .loaded(let output):
            content(output)
        }
    }
}

#if DEBUG
private struct Article: Identifiable {
    var id = UUID()
    var title: String
    var body: String
}

private struct ArticleLoader {
    func loadArticle(withID: Article.ID, _ completion: @escaping (Result<Article, Error>) -> Void) {
        completion(.success(.init(title: "Hello, World!", body: "TIago Ferreira")))
    }

    func loadArticle(withID: Article.ID) async throws -> Article {
        throw AsyncArticleError.testError
    }
}

private enum AsyncArticleError: LocalizedError {
    case testError

    var errorDescription: String? {
        switch self {
        case .testError:
            return "This is a test Error."
        }
    }
}

private struct AsyncArticleView: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        AsyncContentView(source: viewModel) { article in
            NavigationStack {
                ScrollView {
                    VStack(spacing: 20) {
                        Image(systemName: "iphone")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                        Text(article.title).font(.title)
                        Text(article.body)
                    }
                    .padding()
                    .navigationTitle(Text("Async ContentView"))
                }
            }
        } retryHandler: {
            viewModel.alternativeLoad()
        }
    }
}

private extension AsyncArticleView {
    class ViewModel: LoadableObject {
        @Published private(set) var state = LoadingState<Article>.idle
        private let articleID: Article.ID
        private let loader: ArticleLoader

        init(articleID: Article.ID, loader: ArticleLoader) {
            self.articleID = articleID
            self.loader = loader
        }

        @MainActor
        func load() {
            state = .loading

            Task {
                do {
                    let article = try await loader.loadArticle(withID: articleID)
                    self.state = .loaded(article)
                } catch {
                    self.state = .failed(error)
                }
            }
        }

        func alternativeLoad() {
            state = .loading

            loader.loadArticle(withID: articleID) { [weak self] result in
                switch result {
                case .success(let success):
                    self?.state = .loaded(success)
                case .failure(let failure):
                    self?.state = .failed(failure)
                }
            }
        }

        static var mock: ViewModel {
            .init(articleID: .init(), loader: ArticleLoader())
        }
    }
}

struct AsyncArticleView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncArticleView(viewModel: .mock)
    }
}
#endif