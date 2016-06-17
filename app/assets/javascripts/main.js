ready = function ready(){
    MENU.toggledMenu();
    MENU.markMenuActive();
    STUDENTS.createDataTableStudents();
    MASKS.addMasks();
    CLOUDINARY.setUploadWidget();
}

$(document).ready(ready);
$(document).on('page:load', ready);