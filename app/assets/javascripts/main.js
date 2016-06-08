ready = function(){
    MENU.toggledMenu();
    MENU.markMenuActive();
    STUDENTS.createDataTableStudents();
}

$(document).ready(ready);
$(document).on('page:load', ready);