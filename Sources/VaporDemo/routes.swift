import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req async throws in
        try await req.view.render("index", ["title": "Hello Vapor!"])
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }
    
    app.get("error") { req async -> String in
        app.logger.error("This is an error")
        return "Error logged"
    }
    
    app.get("warning") { req async -> String in
        app.logger.warning("This is a warning")
        return "Warning logged"
    }
    
    app.get("info") { req async -> String in
        app.logger.info("This is some info")
        return "Info logged"
    }
    
    app.get("500") { req async throws -> String in
        throw Abort(.internalServerError)
    }
    
    app.get("404") { req async throws -> String in
        throw Abort(.notFound)
    }
    
    app.get("400") { req async throws -> String in
        throw Abort(.badRequest)
    }
    
    app.get("200") { req in
        return HTTPStatus.ok
    }
    
    

    try app.register(collection: TodoController())
}
