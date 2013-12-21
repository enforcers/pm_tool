# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Project.delete_all
Pbs.delete_all

project = Project.create({name: 'Web-Shop'})

dat = Array.new
dat[0] = Pbs.create({name: 'Geschäftsplan und Architektur', project: project, parent: nil, depth: 0, order: 1})
dat[1] = Pbs.create({name: 'Geschäftsplan', project: project, parent: dat[0], depth: 1, order: 1})
dat[2] = Pbs.create({name: 'Business Case', project: project, parent: dat[1], depth: 2, order: 1})
dat[3] = Pbs.create({name: 'Projektplan', project: project, parent: dat[1], depth: 2, order: 2})
dat[4] = Pbs.create({name: 'Lastenheft', project: project, parent: dat[1], depth: 2, order: 3})
dat[5] = Pbs.create({name: 'Architektur', project: project, parent: dat[0], depth: 1, order: 2})
dat[6] = Pbs.create({name: 'Anwendungsarchitektur', project: project, parent: dat[5], depth: 2, order: 1})
dat[7] = Pbs.create({name: 'Technische Architektur', project: project, parent: dat[5], depth: 2, order: 2})
dat[8] = Pbs.create({name: 'Kunden- und Produktverwaltung', project: project, parent: nil, depth: 0, order: 2})
dat[9] = Pbs.create({name: 'Kundendatenbank', project: project, parent: dat[8], depth: 1, order: 1})
dat[10] = Pbs.create({name: 'Kundenstammdaten', project: project, parent: dat[9], depth: 2, order: 1})
dat[11] = Pbs.create({name: 'Kundenbewegungsdaten', project: project, parent: dat[9], depth: 2, order: 2})
dat[12] = Pbs.create({name: 'Produktkatalog', project: project, parent: dat[8], depth: 1, order: 2})
dat[13] = Pbs.create({name: 'Produktstammdaten', project: project, parent: dat[12], depth: 2, order: 1})
dat[14] = Pbs.create({name: 'Produktpreislisten', project: project, parent: dat[12], depth: 2, order: 2})
dat[15] = Pbs.create({name: 'Transaktionsverwaltung', project: project, parent: nil, depth: 0, order: 3})
dat[16] = Pbs.create({name: 'Auftragsverwaltung', project: project, parent: dat[15], depth: 1, order: 1})
dat[17] = Pbs.create({name: 'Warenkorb', project: project, parent: dat[16], depth: 2, order: 1})
dat[18] = Pbs.create({name: 'Auftragsprüfung und -bestätigung', project: project, parent: dat[16], depth: 2, order: 2})
dat[19] = Pbs.create({name: 'Warenwirtschaftsverwaltung', project: project, parent: dat[15], depth: 1, order: 2})
dat[20] = Pbs.create({name: 'Schnittstelle Lagerverwaltung', project: project, parent: dat[19], depth: 2, order: 1})
dat[21] = Pbs.create({name: 'Schnittstelle Bestellwesen', project: project, parent: dat[19], depth: 2, order: 2})
dat[22] = Pbs.create({name: 'Rechnungs- und Zahlungsverwaltung', project: project, parent: dat[15], depth: 1, order: 3})
dat[23] = Pbs.create({name: 'Electronic Bill Presentment', project: project, parent: dat[22], depth: 2, order: 1})
dat[24] = Pbs.create({name: 'Electronic Payments', project: project, parent: dat[22], depth: 2, order: 2})
dat[25] = Pbs.create({name: 'Schnittstelle Finanzbuchhaltung', project: project, parent: dat[22], depth: 2, order: 3})