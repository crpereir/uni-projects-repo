import router from "../../../../../../../static-content/spa/router/Router.js";
import handlers from "../../../../../../../static-content/spa/handlers/playerHandlers.js";
describe('Router Tests', function () {

    it('should create and find getSessions route', function () {
        router.addRouteHandler("sessions", handlers.getSessions)
        router.getRouteHandler("sessions").should.be.equal(handlers.getSessions);
    });

    it('should not find a route with path "abcd"', function () {
        router.addDefaultNotFoundRouteHandler(() => { throw "Default route handler not defined" });
        router.hasRoute("abcd").should.be.false;
        router.getRouteHandler("abcd").should.throw("Default route handler not defined");
    });

    it('should remove a route with path "sessions"', function () {
        router.addRouteHandler("sessions", handlers.getSessions)
        router.hasRoute("sessions").should.be.true;
        router.removeRouteHandler("sessions");
        router.hasRoute("sessions").should.be.false;
    });

    it('should add a default not found route handler', function () {
        router.addDefaultNotFoundRouteHandler(() => { throw "Default route handler not defined" });
        router.getRouteHandler("abcd").should.throw("Default route handler not defined");
    });

})