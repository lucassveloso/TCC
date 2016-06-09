var MASKS = MASKS || {}

MASKS.addMasks = function addMasks() {
  $('.date-mask').mask("99/99/9999");
  $('.cep-mask').mask('00000-000');
  $('.phone-mask').mask('(00)0000-0000');
  $('.cpf-mask').mask('000.000.000-00', {
    reverse: true
  });
}