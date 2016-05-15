address = Address.create(address:'xyz Street', zipcode:'00000-000', city:'City', state:'State', country:'Country', neighborhood: 'Neighborhood', complement: 'Complement', number: 123)
certificate = Certificate.create(type_of:'birth', term_number: 123, sheet_number: 321, book: "A", emission_date: "01/01/2000", federation_unit: "RS",  notarys_office: "notary's office")
identity_document = IdentityDocument.create(identity_number: 123, dispatch_date: "01/01/2000", federation_unit: "RS",  dispatcher_organ: "SSP")
person_father = Person.create(name: "João", genre: "Male", birthdate: "22/08/1965", race: "white", phone: "12345", cellphone: "54321", naturalness: "Viamão, RS", nationality: "brasileira", address: address)
person_son = Person.create(name: "Lucas", genre: "Male", birthdate: "22/08/1995", race: "white", phone: "12345", cellphone: "54321", naturalness: "Viamão, RS", nationality: "brasileira", address: address)
student = Student.create(person: person_son, nis_number: 123, certificate: certificate, identity_document: identity_document, cpf: "000.000.000-00", entry_date: "01/01/2000", special_needs: "Down's syndrome", teaching_step: "EJA", photo_url: "www.photo.com")
person_daughter = Person.create(name: "Maria", genre: "Female", birthdate: "22/08/1995", race: "white", phone: "12345", cellphone: "54321", naturalness: "Viamão, RS", nationality: "brasileira", address: address)
student2 = Student.create(person: person_daughter, nis_number: 123, certificate: certificate, identity_document: identity_document, cpf: "000.000.000-00", entry_date: "01/01/2000", special_needs: "Down's syndrome", teaching_step: "EJA", photo_url: "www.photo.com")
responsible = Responsible.create(person: person_father, kinship: "Father", students: [student, student2])

(1..1000).each do |z|
  student = Student.create(person: person_son, nis_number: 123, certificate: certificate, identity_document: identity_document, cpf: "000.000.000-00", entry_date: "01/01/2000", special_needs: "Down's syndrome", teaching_step: "EJA", photo_url: "www.photo.com")
  student2 = Student.create(person: person_daughter, nis_number: 456, certificate: certificate, identity_document: identity_document, cpf: "000.000.000-00", entry_date: "01/01/2000", special_needs: "Down's syndrome", teaching_step: "EJA", photo_url: "www.photo.com")
  Student.create(person: person_father, nis_number: 789, certificate: certificate, identity_document: identity_document, cpf: "000.000.000-00", entry_date: "01/01/2000", special_needs: "Down's syndrome", teaching_step: "EJA", photo_url: "www.photo.com")
end
