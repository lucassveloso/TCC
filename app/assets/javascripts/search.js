var SEARCH = SEARCH || {}

var count = 0

SEARCH.setAutocompletes = function setAutocompletes(){
  SEARCH.setAutocompleteStudent();
  SEARCH.setAutocompleteTeacher();
  SEARCH.setAutocompleteSchoolClass();
  SEARCH.eventRemoveRowTable();
}

SEARCH.setAutocompleteStudent = function setAutocompleteStudent(){
  $("#students-autocomplete").autocomplete({
        minLength: 2,
        source:function (request, response){
            SEARCH.search(request, response, "/students_search");
        },
        select:function(event, ui){
            event.preventDefault();
            $("#students-autocomplete").val("");
            SEARCH.addStudentTable(ui.item.value);
        },
        focus: function(event, ui) {
            event.preventDefault();
            $(this).val(ui.item.label);
        }
    });
}

SEARCH.setAutocompleteTeacher = function setAutocompleteTeacher(){
  $("#teachers-autocomplete").autocomplete({
        minLength: 2,
        source:function (request, response){
            SEARCH.search(request, response, "/teachers_search");
        },
        select:function(event, ui){
            event.preventDefault();
            $("#teachers-autocomplete").val("");
            SEARCH.addTeacherTable(ui.item.value);
        },
        focus: function(event, ui) {
            event.preventDefault();
            $(this).val(ui.item.label);
        }
    });
}

SEARCH.setAutocompleteSchoolClass = function setAutocompleteSchoolClass(){
  $("#school_classes-autocomplete").autocomplete({
        minLength: 2,
        source:function (request, response){
            SEARCH.search(request, response, "/school_classes_search");
        },
        select:function(event, ui){
            event.preventDefault();
            $("#school_classes-autocomplete").val("");
            SEARCH.addSchoolClassTable(ui.item.value);
        },
        focus: function(event, ui) {
            event.preventDefault();
            $(this).val(ui.item.label);
        }
    });
}

SEARCH.search = function search(request, response, url){
  $.ajax({
    dataType: "json",
    url: url,
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
                label : (url.indexOf('school_classes') > -1) ? data[i].number : data[i].person.name,
                value : data[i]
            };
            result_list.push(result);
        }
        response(result_list);
      }
    }
  });
}

SEARCH.addStudentTable = function addStudentTable(student){
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
                                    <td><a class="glyphicon glyphicon-remove remove-row">Remover</a></td>\
                                  </tr>'
                                );
    count++
  }
  SEARCH.eventRemoveRowTable();
}

SEARCH.addTeacherTable = function addTeacherTable(teacher){
  identical_teachers = $.grep($(".teacher_id"), function(item) {
      return item.value == teacher.id;
  });
  if(identical_teachers.length == 0){
    subject = teacher.subject || "";
    time_load = teacher.time_load || "";
    $("#table-teachers").append(' <tr>\
                                    <input type="hidden" class="teacher_id" name="teachers_ids['+count+']" value="'+teacher.id+'">\
                                    <td>'+teacher.person.name+'</td>\
                                    <td>'+subject+'</td>\
                                    <td>'+teacher.registration_number+'</td>\
                                    <td>'+time_load+'</td>\
                                    <td><a class="glyphicon glyphicon-remove remove-row">Remover</a></td>\
                                  </tr>'
                                );
    count++
  }
  SEARCH.eventRemoveRowTable();
}

SEARCH.addSchoolClassTable = function addSchoolClassTable(school_class){
  identical_school_classes = $.grep($(".school_class_id"), function(item) {
      return item.value == school_class.id;
  });
  if(identical_school_classes.length == 0){
    $("#table-school_classes").append(' <tr>\
                                    <input type="hidden" class="school_class_id" name="school_classes_ids['+count+']" value="'+school_class.id+'">\
                                    <td>'+school_class.number+'</td>\
                                    <td>'+school_class.classroom+'</td>\
                                    <td>'+school_class.grade+'</td>\
                                    <td><a class="glyphicon glyphicon-remove remove-row">Remover</a></td>\
                                  </tr>'
                                );
    count++
  }
  SEARCH.eventRemoveRowTable();
}

SEARCH.removeRowTable = function removeRowTable(link_clicked){
  link_clicked.parent().parent().remove();
}

SEARCH.eventRemoveRowTable = function eventRemoveRowTable(){
  $(".remove-row").click(function(){
    SEARCH.removeRowTable($(this));
  });
}