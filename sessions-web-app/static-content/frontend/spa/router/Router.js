let noDefaultHandler = () => { throw "Default route handler not defined" }

class Router {
    constructor() {
        this.routes = new Map();
    }

    addRouteHandler(path, handler) {
        this.routes.set(path, handler);
    }

    addDefaultNotFoundRouteHandler(notFoundRH) {
        noDefaultHandler = notFoundRH;
    }

    getRouteHandler(path) {
        return this.routes.get(path) || noDefaultHandler;
    }
}

export default new Router();