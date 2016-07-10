var VALIDATION = VALIDATION || {}


VALIDATION.eventsValidate = function eventsValidate(){
 $(".validate-empty").each(function(){
    $(this).focusout(function(){
      VALIDATION.validateEmpty($(this));
    });
 });

}

VALIDATION.validateEmpty = function validateEmpty(input) {
  var divFormGroup = input.parent().parent();
  input.siblings().remove();
  if (input.val() != "") {
    divFormGroup.removeClass("has-error");
  } else {
    divFormGroup.addClass("has-error");
    input.parent().append("<span class='mandatory'>Este campo é obrigatório</span>");
  }
};
