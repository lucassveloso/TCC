ready = function ready(){
    MENU.toggledMenu();
    MENU.markMenuActive();
    STUDENTS.createDataTableStudents();
    MASKS.addMasks();
}

$(document).ready(ready);
$(document).on('page:load', ready);