 var NESTEDFORM = NESTEDFORM || {}

 NESTEDFORM.insertFields = function insertFields(){
    window.NestedFormEvents.prototype.insertFields = function(content, assoc, link) {
    var $tr = $(link).closest('tr');
    return $(content).insertBefore($tr);
  }
}