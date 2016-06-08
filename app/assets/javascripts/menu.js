var MENU = MENU || {}

MENU.toggledMenu = function(){
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
}

MENU.markMenuActive = function(){
    var pageUrlPath =$(location).attr('pathname');
    $(".sidebar-nav li a").each(function(){
        if($(this).attr("href") == pageUrlPath)
            $(this).addClass("menu-active");
    })
}