const todos = [] // localStorage.getItem [];
const todoUl = document.querySelector(".todos");
const addTodoForm = document.querySelector(".add-todo-form");
const todoCheckbox = document.querySelector("input[type='checkbox']");

const addTodo = function() {
    const inputTodo = document.querySelector("input[name='add-todo']").value;
    const objTodo = {
        done: false,
        todo: inputTodo
    }
    todos.push(objTodo);
    storeLocally();
    inputTodo.value = "";
    populateList(todos);
}

const populateList = function(todos) {
    todos.forEach(function(objTodo, i) {
        const todoLabel = document.createElement('label');
        const todoBox = document.createElement('input');
        const todoLi = document.createElement('li');
        todoLabel.innerHTML = objTodo.todo;
        todoBox.setAttribute("type", "checkbox");
        todoBox.setAttribute("data-index", i);
        todoLi.appendChild(todoLabel);
        todoLi.appendChild(todoBox);
        const todoUl = document.querySelector(".todos");
        todoUl.appendChild(todoLi);
    })
}

const storeLocally = function() {
    // todos.forEach(function(todo) {
    //     let todoString = JSON.stringify(todo); //=> string
    //     // let todoObj2 = JSON.parse(todoString); //=> obj 
    //     localStorage.setItem(todoString); 
    // })
    const todoStrings = JSON.stringify(todos);
    localStorage.setItem("todoList", todoStrings);
}


const toggleTodo = function(e) {
    todos[e.target.dataset.index]
}


addTodoForm.addEventListener('submit', addTodo);
todoUl.addEventListener('click', toggleTodo);





