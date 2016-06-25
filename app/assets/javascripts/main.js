ready = function ready(){
    MENU.toggledMenu();
    MENU.markMenuActive();
    DATATABLE.createDataTables();
    MASKS.addMasks();
    CLOUDINARY.setUploadWidget();

    SCHOOL_CLASSES.searchStudent();
}

$(document).ready(ready);
$(document).on('page:load', ready);