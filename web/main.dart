import 'dart:html';

InputElement todoInput;
ButtonElement todoButton;

DivElement todoList;
DivElement doingList;
DivElement doneList;

void main() {
  // Get the references to the HTML elements.
  todoInput = querySelector('#todo-input');
  todoButton = querySelector('#todo-button');

  todoList = querySelector('#todo-list');
  doingList = querySelector('#doing-list');
  doneList = querySelector('#done-list');

  // React to button click.
  todoButton.onClick.listen(addTodoItem);
}

/// Adds an item to the Todo list.
void addTodoItem(Event e) {
  var newTodo = new AnchorElement(href: '#');
  newTodo.classes.add('list-group-item');
  newTodo.text = todoInput.value;
  newTodo.onClick.listen(moveItem);

  todoInput.value = '';
  todoList.children.add(newTodo);
}

/// Moves an item to the doing or done list or deletes it at the end.
void moveItem(Event e) {
  // Get the clicked item from the event.
  Element item = e.target;

  if (item.parent == todoList) {
    doingList.children.add(item);
  } else if (item.parent == doingList) {
    doneList.children.add(item);
  } else {
    item.remove();
  }
}
