# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Project.delete_all
Product.delete_all

project = Project.create({name: 'Web-Shop'})

dat = Array.new
dat[26] = Product.create({name: 'Web-Shop', project: project, parent: nil, depth: 0, place: 1})
dat[0] = Product.create({name: 'Geschäftsplan und Architektur', project: project, parent: dat[26], depth: 1, place: 1})
dat[1] = Product.create({name: 'Geschäftsplan', project: project, parent: dat[0], depth: 2, place: 1})
dat[2] = Product.create({name: 'Business Case', project: project, parent: dat[1], depth: 3, place: 1})
dat[3] = Product.create({name: 'Projektplan', project: project, parent: dat[1], depth: 3, place: 2})
dat[4] = Product.create({name: 'Lastenheft', project: project, parent: dat[1], depth: 3, place: 3})
dat[5] = Product.create({name: 'Architektur', project: project, parent: dat[0], depth: 2, place: 2})
dat[6] = Product.create({name: 'Anwendungsarchitektur', project: project, parent: dat[5], depth: 3, place: 1})
dat[7] = Product.create({name: 'Technische Architektur', project: project, parent: dat[5], depth: 3, place: 2})
dat[8] = Product.create({name: 'Kunden- und Produktverwaltung', project: project, parent: dat[26], depth: 1, place: 2})
dat[9] = Product.create({name: 'Kundendatenbank', project: project, parent: dat[8], depth: 2, place: 1})
dat[10] = Product.create({name: 'Kundenstammdaten', project: project, parent: dat[9], depth: 3, place: 1})
dat[11] = Product.create({name: 'Kundenbewegungsdaten', project: project, parent: dat[9], depth: 3, place: 2})
dat[12] = Product.create({name: 'Produktkatalog', project: project, parent: dat[8], depth: 2, place: 2})
dat[13] = Product.create({name: 'Produktstammdaten', project: project, parent: dat[12], depth: 3, place: 1})
dat[14] = Product.create({name: 'Produktpreislisten', project: project, parent: dat[12], depth: 3, place: 2})
dat[15] = Product.create({name: 'Transaktionsverwaltung', project: project, parent: dat[26], depth: 1, place: 3})
dat[16] = Product.create({name: 'Auftragsverwaltung', project: project, parent: dat[15], depth: 2, place: 1})
dat[17] = Product.create({name: 'Warenkorb', project: project, parent: dat[16], depth: 3, place: 1})
dat[18] = Product.create({name: 'Auftragsprüfung und -bestätigung', project: project, parent: dat[16], depth: 3, place: 2})
dat[19] = Product.create({name: 'Warenwirtschaftsverwaltung', project: project, parent: dat[15], depth: 2, place: 2})
dat[20] = Product.create({name: 'Schnittstelle Lagerverwaltung', project: project, parent: dat[19], depth: 3, place: 1})
dat[21] = Product.create({name: 'Schnittstelle Bestellwesen', project: project, parent: dat[19], depth: 3, place: 2})
dat[22] = Product.create({name: 'Rechnungs- und Zahlungsverwaltung', project: project, parent: dat[15], depth: 2, place: 3})
dat[23] = Product.create({name: 'Electronic Bill Presentment', project: project, parent: dat[22], depth: 3, place: 1})
dat[24] = Product.create({name: 'Electronic Payments', project: project, parent: dat[22], depth: 3, place: 2})
dat[25] = Product.create({name: 'Schnittstelle Finanzbuchhaltung', project: project, parent: dat[22], depth: 3, place: 3})