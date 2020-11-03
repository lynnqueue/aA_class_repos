const DomNodeCollection = require("./dom_node_collection");

window.$l = (arg) => {
    if (typeof arg === "string") {
        return getNodes(arg);
    } else if (typeof arg === "HTMLElement") {
        return new DomNodeCollection([arg]);
    } else if (typeof arg === 'function') {
        return registerDocReadyCallback(arg);
    }



}

function getNodes(str) {
    const nodes = document.querySelectorAll(str);
    const nodesArr = Array.from(nodes);
    const collection = new DomNodeCollection (nodesArr);

    return collection;
}


document.addEventListener('DOMContentLoaded', () => {
    docReady = true;
    docReadyCallbacks.forEach(callback => callback());
});

registerDocReadyCallback = (func) => {
    if (!docReady) {
        docReadyCallbacks.push(func);
    } else {
        func();
    }
};

let docReady = false;
const docReadyCallbacks = [];
