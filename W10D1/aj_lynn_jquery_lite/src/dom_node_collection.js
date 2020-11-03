class DomNodeCollection {
    constructor (nodesArr) {
        this.nodes = nodesArr;
    }


    html(str) {
        if (typeof str === "string") {
            this.each(node => {
                node.innerHTML = str;
            })
        } else if (this.nodes.length) {
            return this.nodes[0].innerHTML;
        }
    }

    empty() {
        this.html("");
    }

    append(child) {
        if (!this.nodes.length) return;

        if (typeof child === "object" && typeof child !== "DomNodeCollection") {
            child = $l(child);
        } 
        
        if (typeof child === "string") {
            this.each(node => {
                node.innerHTML += child;
            })
        } else {
            this.each(node => {
                child.each(childNode => {
                    node.appendChild(childNode);
                })
            })
        }
    }

    attr(key, val) {
        if (typeof val !== "undefined") {
            this.each(node => {
                node.setAttribute(key, val);
            })
        } else {
            return this.nodes[0].getAttribute(key);
        }
    }

    addClass(newClass) {
        this.each(node => {
            node.classList.add(newClass);
        })
    }

    removeClass(newClass) {
        this.each(node => {
            node.classList.remove(newClass);
        })
    }

    children() {
        const kids = [];
        this.each(node => {
            let arr = Array.from(node.children);
            kids = kids.concat(arr); 
        })
        return new DomNodeCollection(kids);
    }

    parent() {
        
        const parentNodes = [];
        this.each(({ parentNode }) => {
            // we apply 'visited' property to prevent adding duplicate parents
            if (!parentNode.visited) {
                parentNodes.push(parentNode);
                parentNode.visited = true;
            }
        });
        parentNodes.forEach((node) => {
            node.visited = false;
        });

        return new DomNodeCollection(parentNodes);
    }

    find(selector) {
        const nodes = [];
        this.each(node => {
             nodes = nodes.concat(Array.from(node.querySelectorAll(selector)));
        })
        return new DomNodeCollection(nodes);
    }

    remove () {
        this.each(node => {
            node.parentNode.removeChild(node);
        })
    }

    on(event, cb) {
        this.each(node => {
            node.addEvenListener(event, cb);
        })
        const eventKey = `jqliteEvents-${eventName}`;
        if (typeof node[eventKey] === "undefined") {
            node[eventKey] = [];
        }
        node[eventKey].push(callback);
    };

    off(event) {
        this.each(node => {
        const eventKey = `jqliteEvents-${eventName}`;
        if (node[eventKey]) {
            node[eventKey].forEach(cb => {
                node.remoceEvenListener(event, cb);
            })
        }           
        })
        node[eventKey] = [];
    }
}







module.exports = DomNodeCollection;