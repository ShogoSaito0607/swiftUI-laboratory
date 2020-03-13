extension String {
    func reshapeText() -> String {
        return replacingOccurrences(of: #"([\|(\{][^\(|\)]*[\)|\}])"#,
            with: "$1\n",
            options: .regularExpression,
            range: self.range(of: self))
    }
}
