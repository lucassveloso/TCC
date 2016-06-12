ready = function ready(){
    MENU.toggledMenu();
    MENU.markMenuActive();
    STUDENTS.createDataTableStudents();
    MASKS.addMasks();
    NESTEDFORM.insertFields();
}

$(document).ready(ready);
$(document).on('page:load', ready);