var SEARCH = SEARCH || {}

var count = 0

SEARCH.setAutocompletes = function setAutocompletes(){
  SEARCH.setAutocompleteStudent();
  SEARCH.setAutocompleteTeacher();
  SEARCH.setAutocompleteSchoolClass();
  SEARCH.setAutocompleteGuardian();
  SEARCH.eventRemoveRowTable();
}

SEARCH.setAutocompleteGuardian = function setAutocompleteGuardian(){
  $("#guardians-autocomplete").autocomplete({
        minLength: 2,
        source:function (request, response){
            SEARCH.search(request, response, "/guardians_search");
        },
        select:function(event, ui){
            event.preventDefault();
            $("#guardians-autocomplete").val("");
            SEARCH.addGuardianKinshipTable(ui.item.value);
        },
        focus: function(event, ui) {
            event.preventDefault();
            $(this).val(ui.item.label);
        }

    });
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
            if($(location).attr('pathname').indexOf('guardian') > -1){
              SEARCH.addStudentKinshipTable(ui.item.value);
            }else{
              SEARCH.addStudentTable(ui.item.value);
            }
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

SEARCH.addStudentKinshipTable = function addStudentKinshipTable(student){
  identical_students = $.grep($(".student_id"), function(item) {
      return item.value == student.id;
  });
  if(identical_students.length == 0){
    nis_number = student.nis_number || "";
    school_class_number = student.school_class ? student.school_class.number : "";
    $("#table-kinships").append(' <tr>\
                                    <input type="hidden" class="student_id" name="students_ids['+count+']" value="'+student.id+'">\
                                    <td><input class="form-control" placeholder="Exemplo: Pai/Filha" type="text" name="kinships['+count+']" ></td>\
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

SEARCH.addGuardianKinshipTable = function addGuardianKinshipTable(guardian){
  identical_guardians = $.grep($(".guardian_id"), function(item) {
      return item.value == guardian.id;
  });
  if(identical_guardians.length == 0){
    $("#table-kinships").append(' <tr>\
                                    <input type="hidden" class="guardian_id" name="guardians_ids['+count+']" value="'+guardian.id+'">\
                                    <td><input class="form-control" placeholder="Exemplo: Pai/Filha" type="text" name="kinships['+count+']" ></td>\
                                    <td>'+guardian.person.name+'</td>\
                                    <td>'+guardian.person.genre+'</td>\
                                    <td>'+guardian.person.phone+'</td>\
                                    <td>'+guardian.person.cellphone+'</td>\
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