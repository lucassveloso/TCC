Authorization.create(description:"Uso de imagem")
Authorization.create(description:"Passeios e Eventos")
Authorization.create(description:"Retirar livros na biblioteca")
AdditionalActivity.create(activity:"Mais Educação")
AdditionalActivity.create(activity:"Sala de Recursos")
AdditionalActivity.create(activity:"Laboratório de Aprendizagem")
AdditionalActivity.create(activity:"Reforço Escolar")

address = Address.create(address:'xyz Street', zipcode:'00000-000', city:'City', state:'State', country:'Country', neighborhood: 'Neighborhood', complement: 'Complement', number: 123)
school_class = SchoolClass.create(number:120, classroom:"Sala 10", grade:"4º Ano")
identity_document = IdentityDocument.create(identity_number: 123, dispatch_date: "01/01/2000", federation_unit: "RS",  dispatcher_organ: "SSP")
documents = Document.create(identity_document: identity_document, cpf: "123123123123")
certificate = Certificate.create(document: documents, type_of:'birth', term_number: 123, sheet_number: 321, book: "A", emission_date: "01/01/2000", federation_unit: "RS",  notarys_office: "notary's office")
person_father = Person.create(document: documents, name: "João", genre: "Male", birthdate: "22/08/1965", ethnicity: "white", phone: "12345", cellphone: "54321", naturalness: "Viamão, RS", nationality: "brasileira", address: address)
person_son = Person.create(document: documents, name: "Lucas", genre: "Male", birthdate: "22/08/1995", ethnicity: "white", phone: "12345", cellphone: "54321", naturalness: "Viamão, RS", nationality: "brasileira", address: address)
person_daughter = Person.create(document: documents, name: "Maria", genre: "Female", birthdate: "22/08/1995", ethnicity: "white", phone: "12345", cellphone: "54321", naturalness: "Viamão, RS", nationality: "brasileira", address: address)

(1..100).each do |z|
  student = Student.create(person: person_son, nis_number: 123, school_class: school_class, entry_date: "01/01/2000", special_needs: "Down's syndrome", teaching_step: "EJA")
  student2 = Student.create(person: person_daughter, nis_number: 456, school_class: school_class, entry_date: "01/01/2000", special_needs: "Down's syndrome", teaching_step: "EJA")
  Student.create(person: person_father, nis_number: 789, school_class: school_class, entry_date: "01/01/2000", special_needs: "Down's syndrome", teaching_step: "EJA")
end
