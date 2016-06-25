var SCHOOL_CLASSES = SCHOOL_CLASSES || {}

var count = 0

SCHOOL_CLASSES.searchStudent = function searchStudent(){
  SCHOOL_CLASSES.eventRemoveStudent();
  $("#students-search-txt").autocomplete({
        minLength: 2,
        source:function (request, response){
            SCHOOL_CLASSES.getResultSearchStudents(request, response);
        },
        select:function(event, ui){
            event.preventDefault();
            $("#students-search-txt").val("");
            SCHOOL_CLASSES.addStudent(ui.item.value);
        },
        focus: function(event, ui) {
            event.preventDefault();
            $(this).val(ui.item.label);
        }
    });
}

 SCHOOL_CLASSES.getResultSearchStudents = function getResultSearchStudents(request, response){
  $.ajax({
    dataType: "json",
    url: "/autocomplete/school_classes/students",
    type: "GET",
    data : {
        "text_search" : request.term
    },
    success: function(data){
      if(!data.length){
        var result = [
          {
          label: 'Nenhum resultado encontrado',
          value: response.term
          }
        ];
        response(result);
      }
      else{
        var result_list = [];
        for(var i = 0; i< data.length; i++){
            var result = {
                label : data[i].person.name,
                value : data[i]
            };
            result_list.push(result);
        }
        response(result_list);
      }
    }
  });
}

SCHOOL_CLASSES.addStudent = function addStudent(student){
  identical_students = $.grep($(".student_id"), function(item) {
      return item.value == student.id;
  });
  if(identical_students.length == 0){
    nis_number = student.nis_number || "";
    school_class_number = student.school_class ? student.school_class.number : "";
    $("#table-students").append(' <tr>\
                                    <input type="hidden" class="student_id" name="students_ids['+count+']" value="'+student.id+'">\
                                    <td>'+student.person.name+'</td>\
                                    <td>'+student.person.genre+'</td>\
                                    <td>'+nis_number+'</td>\
                                    <td>'+school_class_number+'</td>\
                                    <td><a class="glyphicon glyphicon-remove remove-student">Remover</a></td>\
                                  </tr>'
                                );
    count++
  }
  SCHOOL_CLASSES.eventRemoveStudent();
}

SCHOOL_CLASSES.removeStudent = function removeStudent(link_clicked){
  link_clicked.parent().parent().remove();
}

SCHOOL_CLASSES.eventRemoveStudent = function eventRemoveStudent(){
  $(".remove-student").click(function(){
    SCHOOL_CLASSES.removeStudent($(this));
  });
}