import {h1, h2, button, input} from "../../../../../../../static-content/spa/lib/Library.js"
describe('Frontend Library Tests', function () {
    it('should create a h1 element', function () {
        const element = h1({},"Test");
        element.textContent.should.be.equal("Test");
    });
    it('should create a h1 element with id equal to "test" and class equal to "test"', function () {
        const element = h1({attributes: {id: "test", class: "test"}});
        element.id.should.be.equal("test");
        element.className.should.be.equal("test");
    });
    it('should create a h1 element with an h2 with text "Test" as a child element', function () {
        const element = h1({},[h2({},"Test")]);
        element.children[0].tagName.should.be.equal("H2");
        element.children[0].textContent.should.be.equal("Test");
    });

    it('should create a button with text "click me" and an onClick function that when called should change the text to "clicked', function () {
        const testButton = button({
            onClick: () => {
                testButton.textContent = "clicked";
            }
        }, "click me");
        testButton.textContent.should.be.equal("click me");
        testButton.click();
        testButton.textContent.should.be.equal("clicked");
    });

    it('should create an input element with type equal to "text" and value equal to "" and an onChange function that when called should change the value to "changed"', function () {
        const testInput = input({
            attributes: {
                type: "text",
                value: ""
            },
            onChange: () => {
                testInput.value = "changed";
            }
        });
        testInput.value.should.be.equal("");
        testInput.dispatchEvent(new Event('change'));
        testInput.value.should.be.equal("changed");
    });

    it('should create a h2 element with text "Hello"', function () {
        const element = h2({}, "Hello");
        element.textContent.should.be.equal("Hello");
    });

    it('should create a button with id "myButton"', function () {
        const element = button({attributes: {id: "myButton"}}, "Click me");
        element.id.should.be.equal("myButton");
    });

    it('should create an input element with type "password"', function () {
        const element = input({attributes: {type: "password"}});
        element.type.should.be.equal("password");
    });

    it('should create a h1 element with a button as a child element', function () {
        const element = h1({}, [button({}, "Click me")]);
        element.children[0].tagName.should.be.equal("BUTTON");
    });
})