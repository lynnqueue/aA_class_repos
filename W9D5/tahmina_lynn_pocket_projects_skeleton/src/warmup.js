
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {

    if (htmlElement.children.length !== 0) {
        // debugger
        htmlElement.removeChild(htmlElement.lastChild);
        // const array = Array.from(htmlElement.children);
        
    }
    const paragraph = document.createElement('p');
    paragraph.innerHTML = string;
    htmlElement.appendChild(paragraph);
};

htmlGenerator('i love/hate js.', partyHeader);