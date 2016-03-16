# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



diseases = ['Blood Cancer',
'Typhoid', 'HIV/AIDS']

symptoms = ['swollen lymphatic node', 'fatigue', 'painful back', 'constipation', 'headache', 'sore throat',
'lesions on the tongue', 'chronic fatigue', 'dehydration', 'rectal pain', 'blood in stools', 'black, tarry stools']

diseases_symptoms = ['insert into diseases_symptoms values(1,1);', 'insert into diseases_symptoms values(2,1);',
                     'insert into diseases_symptoms values(3,1);','insert into diseases_symptoms values(4,2);',
                     'insert into diseases_symptoms values(5,2);','insert into diseases_symptoms values(6,2);',
                     'insert into diseases_symptoms values(7,2);','insert into diseases_symptoms values(8,2);',
                     'insert into diseases_symptoms values(9,3);','insert into diseases_symptoms values(10,3);',
<<<<<<< HEAD
                     'insert into diseases_symptoms values(11,3);','insert into diseases_symptoms values(12,3);',
                     'insert into diseases_symptoms values(17,8);','insert into diseases_symptoms values(18,8);']
=======
                     'insert into diseases_symptoms values(11,3);','insert into diseases_symptoms values(12,3);']
>>>>>>> 1a92750dd1010ccc83a7613779a08d80c682606f

diseases.each do |disease|
  Disease.where(name: disease).first_or_create(name: disease)
end

symptoms.each do |symptom|
  Symptom.where(name: symptom).first_or_create(name: symptom)
end

diseases_symptoms.each do |disease_symptom|
  ActiveRecord::Base.connection.execute(disease_symptom)
end



Treatment.create!(medicine: "nothing", food: "nothing", activities: "nothing", disease_id: 1)
Treatment.create!(medicine: "nothing", food: "something", activities: "nothing", disease_id: 2)
Treatment.create!(medicine: "something", food: "something", activities: "something", disease_id: 3)



