import 'dart:html';

InputElement todoInput;
ButtonElement todoButton;

DivElement todoList;
DivElement doingList;
DivElement doneList;

void main() {
  // Set the subtitle.
  querySelector('#subtitle').text = 'by Marco';

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
  AnchorElement newTodo = new AnchorElement();
  newTodo.href = '#';
  newTodo.text = todoInput.value;
  newTodo.classes.add('list-group-item');

  newTodo.onClick.listen(moveItem);

  todoList.children.add(newTodo);

  // Clear the textfield value.
  todoInput.value = '';
}

/// Moves an item to the doing or done list or deletes it at the end.
void moveItem(Event e) {
  // Get the clicked item from the event.
  Element item = e.target;

  // Move or delete depending on the list the item is part of.
  if (item.parent == todoList) {
    doingList.children.add(item);
  } else if (item.parent == doingList) {
    doneList.children.add(item);
  } else {
    item.remove();
  }
}
