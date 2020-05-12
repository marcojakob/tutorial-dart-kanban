import 'dart:html';

InputElement todoInput;
ButtonElement todoButton;

DivElement todoList;
DivElement doingList;
DivElement doneList;

void main() {
  // Den Untertitel setzen.
  var subtitle = querySelector('#subtitle');
  subtitle.text = 'by Marco';

  // Die Referenzen auf die HTML-Elemente holen.
  todoInput = querySelector('#todo-input');
  todoButton = querySelector('#todo-button');

  todoList = querySelector('#todo-list');
  doingList = querySelector('#doing-list');
  doneList = querySelector('#done-list');

  // Auf Knopfdruck-Event reagieren.
  todoButton.onClick.listen(addTodoItem);

  // Add some example todos.
  addExampleTodos();
}

/// Fügt ein neues Todo-Element zur Liste hinzu.
void addTodoItem(Event e) {
  var newTodo = AnchorElement();
  newTodo.href = '#';
  newTodo.text = todoInput.value;
  newTodo.classes.add('list-group-item');
  newTodo.classes.add('list-group-item-action');

  // Klick-Event-Listener für das Todo-Element.
  newTodo.onClick.listen(moveItem);

  todoList.children.add(newTodo);

  // Das Textfeld löschen.
  todoInput.value = '';
}

/// Verschiebt ein Todo-Element zur 'doing' oder 'done' Liste oder löscht es,
/// wenn es in der letzten Liste angeklickt wird.
void moveItem(Event e) {
  // Das gecklickte Element aus dem Event holen.
  Element item = e.target;

  // Verschieben oder löschen, je nach dem in welcher Liste das Element ist.
  if (item.parent == todoList) {
    doingList.children.add(item);
  } else if (item.parent == doingList) {
    doneList.children.add(item);
  } else {
    item.remove();
  }
}

/// Adds some example todos.
void addExampleTodos() {
  var one = AnchorElement(href: '#')
    ..text = '⇧ Add More Todo\'s ⇧'
    ..classes.add('list-group-item')
    ..classes.add('list-group-item-action')
    ..onClick.listen(moveItem);
  todoList.children.add(one);

  var two = AnchorElement(href: '#')
    ..text = 'Follow @codemakery'
    ..classes.add('list-group-item')
    ..classes.add('list-group-item-action')
    ..onClick.listen(moveItem);
  todoList.children.add(two);

  var three = AnchorElement(href: '#')
    ..text = 'Enjoy Programming'
    ..classes.add('list-group-item')
    ..classes.add('list-group-item-action')
    ..onClick.listen(moveItem);
  doingList.children.add(three);

  var four = AnchorElement(href: '#')
    ..text = 'Learn HTML'
    ..classes.add('list-group-item')
    ..classes.add('list-group-item-action')
    ..onClick.listen(moveItem);
  doneList.children.add(four);

  var five = AnchorElement(href: '#')
    ..text = 'Learn CSS'
    ..classes.add('list-group-item')
    ..classes.add('list-group-item-action')
    ..onClick.listen(moveItem);
  doneList.children.add(five);
}
