ready = function ready(){
    MENU.toggledMenu();
    MENU.markMenuActive();
    DATATABLE.createDataTables();
    MASKS.addMasks();
    CLOUDINARY.setUploadWidget();
    SEARCH.setAutocompletes();
}

$(document).ready(ready);
$(document).on('page:load', ready);