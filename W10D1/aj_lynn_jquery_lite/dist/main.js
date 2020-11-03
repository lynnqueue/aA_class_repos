/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is not neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/dom_node_collection.js":
/*!************************************!*\
  !*** ./src/dom_node_collection.js ***!
  \************************************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements: module */
/***/ ((module) => {

eval("class DomNodeCollection {\n    constructor (nodesArr) {\n        this.nodes = nodesArr;\n    }\n\n\n    html(str) {\n        if (typeof str === \"string\") {\n            this.each(node => {\n                node.innerHTML = str;\n            })\n        } else if (this.nodes.length) {\n            return this.nodes[0].innerHTML;\n        }\n    }\n\n    empty() {\n        this.html(\"\");\n    }\n\n    append(child) {\n        if (!this.nodes.length) return;\n\n        if (typeof child === \"object\" && typeof child !== \"DomNodeCollection\") {\n            child = $l(child);\n        } \n        \n        if (typeof child === \"string\") {\n            this.each(node => {\n                node.innerHTML += child;\n            })\n        } else {\n            this.each(node => {\n                child.each(childNode => {\n                    node.appendChild(childNode);\n                })\n            })\n        }\n    }\n\n    attr(key, val) {\n        if (typeof val !== \"undefined\") {\n            this.each(node => {\n                node.setAttribute(key, val);\n            })\n        } else {\n            return this.nodes[0].getAttribute(key);\n        }\n    }\n\n    addClass(newClass) {\n        this.each(node => {\n            node.classList.add(newClass);\n        })\n    }\n\n    removeClass(newClass) {\n        this.each(node => {\n            node.classList.remove(newClass);\n        })\n    }\n\n    children() {\n        const kids = [];\n        this.each(node => {\n            let arr = Array.from(node.children);\n            kids = kids.concat(arr); \n        })\n        return new DomNodeCollection(kids);\n    }\n\n    parent() {\n        \n        const parentNodes = [];\n        this.each(({ parentNode }) => {\n            // we apply 'visited' property to prevent adding duplicate parents\n            if (!parentNode.visited) {\n                parentNodes.push(parentNode);\n                parentNode.visited = true;\n            }\n        });\n        parentNodes.forEach((node) => {\n            node.visited = false;\n        });\n\n        return new DomNodeCollection(parentNodes);\n    }\n\n    find(selector) {\n        const nodes = [];\n        this.each(node => {\n             nodes = nodes.concat(Array.from(node.querySelectorAll(selector)));\n        })\n        return new DomNodeCollection(nodes);\n    }\n\n    remove () {\n        this.each(node => {\n            node.parentNode.removeChild(node);\n        })\n    }\n\n    on(event, cb) {\n        this.each(node => {\n            node.addEvenListener(event, cb);\n        })\n        const eventKey = `jqliteEvents-${eventName}`;\n        if (typeof node[eventKey] === \"undefined\") {\n            node[eventKey] = [];\n        }\n        node[eventKey].push(callback);\n    };\n\n    off(event) {\n        this.each(node => {\n        const eventKey = `jqliteEvents-${eventName}`;\n        if (node[eventKey]) {\n            node[eventKey].forEach(cb => {\n                node.remoceEvenListener(event, cb);\n            })\n        }           \n        })\n        node[eventKey] = [];\n    }\n}\n\n\n\n\n\n\n\nmodule.exports = DomNodeCollection;\n\n//# sourceURL=webpack:///./src/dom_node_collection.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		if(__webpack_module_cache__[moduleId]) {
/******/ 			return __webpack_module_cache__[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
(() => {
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements: __webpack_require__ */
eval("const DomNodeCollection = __webpack_require__(/*! ./dom_node_collection */ \"./src/dom_node_collection.js\");\n\nwindow.$l = (arg) => {\n    if (typeof arg === \"string\") {\n        return getNodes(arg);\n    } else if (typeof arg === \"HTMLElement\") {\n        return new DomNodeCollection([arg]);\n    } else if (typeof arg === 'function') {\n        return registerDocReadyCallback(arg);\n    }\n\n\n\n}\n\nfunction getNodes(str) {\n    const nodes = document.querySelectorAll(str);\n    const nodesArr = Array.from(nodes);\n    const collection = new DomNodeCollection (nodesArr);\n\n    return collection;\n}\n\n\ndocument.addEventListener('DOMContentLoaded', () => {\n    docReady = true;\n    docReadyCallbacks.forEach(callback => callback());\n});\n\nregisterDocReadyCallback = (func) => {\n    if (!docReady) {\n        docReadyCallbacks.push(func);\n    } else {\n        func();\n    }\n};\n\nlet docReady = false;\nconst docReadyCallbacks = [];\n\n\n//# sourceURL=webpack:///./src/index.js?");
})();

/******/ })()
;