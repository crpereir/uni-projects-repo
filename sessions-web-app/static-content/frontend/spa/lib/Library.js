import elements from "./Elements.js";


function initializeCreateElement(elements) {
    return elements.reduce((functions, element) => {
        functions[element] = ({attributes = {}, onClick = () => {}, onChange = () => {}} = {}, children = []) => {
            const resultElem = document.createElement(element);
            Object.entries(attributes).forEach(([attrName, attrValue]) => {
                if (attrName === 'style' && typeof attrValue === 'object') {
                    Object.assign(resultElem.style, attrValue);
                } else {
                    resultElem.setAttribute(attrName, attrValue);
                }
            });
            if(!Array.isArray(children)){
                children = [children];
            }
            children.forEach(child => {
                if (typeof child === "string") {
                    resultElem.appendChild(document.createTextNode(child));
                } else {
                    resultElem.appendChild(child);
                }
            });
            if(onClick){
                resultElem.addEventListener("click", onClick);
            }
            if(onChange){
                resultElem.addEventListener("change", onChange);
            }
            return resultElem;
        };
        return functions;
    }, {});
}




const createElementFunctions = initializeCreateElement(elements);

const { html, head, title, body, h1, h2, h3, h4, h5, h6, div, p, a, ul, li, img, select, label,option, span, form, input, button, table, tr, td } = createElementFunctions;
export { html, head, title, body, h1, h2, h3, h4, h5, h6, div, p, a, ul, li, img, span, select ,label, option, form, input, button, table, tr, td };
