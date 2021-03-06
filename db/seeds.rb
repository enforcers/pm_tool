# This file should contain all the record creation needed to seed the productabase with its default values.
# The producta can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Project.delete_all
Product.delete_all
Work.delete_all
Resource.delete_all
ResourceAllocation.delete_all
Effort.delete_all
Milestone.delete_all

project = Project.create({name: 'Web-Shop'})
Project.create({name: 'Empty Project'})

root = project.products.first
product = Array.new
#product[26] = Product.create({name: 'Web-Shop', project: project, parent: nil, position: 0})
product[0] = Product.create({name: 'Geschäftsplan und Architektur', project: project, parent: root, position: 1})
product[1] = Product.create({name: 'Geschäftsplan', project: project, parent: product[0], position: 1})
product[2] = Product.create({name: 'Business Case', project: project, parent: product[1], position: 1})
product[3] = Product.create({name: 'Projektplan', project: project, parent: product[1], position: 2})
product[4] = Product.create({name: 'Lastenheft', project: project, parent: product[1], position: 3})
product[5] = Product.create({name: 'Architektur', project: project, parent: product[0], position: 2})
product[6] = Product.create({name: 'Anwendungsarchitektur', project: project, parent: product[5], position: 1})
product[7] = Product.create({name: 'Technische Architektur', project: project, parent: product[5], position: 2})
product[8] = Product.create({name: 'Kunden- und Produktverwaltung', project: project, parent: root, position: 2})
product[9] = Product.create({name: 'Kundendatenbank', project: project, parent: product[8], position: 1})
product[10] = Product.create({name: 'Kundenstammdaten', project: project, parent: product[9], position: 1})
product[11] = Product.create({name: 'Kundenbewegungsdaten', project: project, parent: product[9], position: 2})
product[12] = Product.create({name: 'Produktkatalog', project: project, parent: product[8], position: 2})
product[13] = Product.create({name: 'Produktstammdaten', project: project, parent: product[12], position: 1})
product[14] = Product.create({name: 'Produktpreislisten', project: project, parent: product[12], position: 2})
product[15] = Product.create({name: 'Transaktionsverwaltung', project: project, parent: root, position: 3})
product[16] = Product.create({name: 'Auftragsverwaltung', project: project, parent: product[15], position: 1})
product[17] = Product.create({name: 'Warenkorb', project: project, parent: product[16], position: 1})
product[18] = Product.create({name: 'Auftragsprüfung und -bestätigung', project: project, parent: product[16], position: 2})
product[19] = Product.create({name: 'Warenwirtschaftsverwaltung', project: project, parent: product[15], position: 2})
product[20] = Product.create({name: 'Schnittstelle Lagerverwaltung', project: project, parent: product[19], position: 1})
product[21] = Product.create({name: 'Schnittstelle Bestellwesen', project: project, parent: product[19], position: 2})
product[22] = Product.create({name: 'Rechnungs- und Zahlungsverwaltung', project: project, parent: product[15], position: 3})
product[23] = Product.create({name: 'Electronic Bill Presentment', project: project, parent: product[22], position: 1})
product[24] = Product.create({name: 'Electronic Payments', project: project, parent: product[22], position: 2})
product[25] = Product.create({name: 'Schnittstelle Finanzbuchhaltung', project: project, parent: product[22], position: 3})

root = project.works.first
work = Array.new

work[0] = Work.create({name: 'Projektmanagement', project: project, parent: root, position: 1})
work[1] = Work.create({name: 'Geschäftsmodellierung', project: project, parent: work[0], position: 1})
work[2] = Work.create({name: 'Wirtschaftslichkeitsrechnung erstellen', project: project, parent: work[1], position: 1, output_id: product[2].id})
work[3] = Work.create({name: 'Lastenheft erstellen', project: project, parent: work[1], position: 2, output_id: product[4].id})
work[4] = Work.create({name: 'Projektplanung', project: project, parent: work[0], position: 2})
work[5] = Work.create({name: 'Ablauf- und Terminplanung', project: project, parent: work[4], position: 1})
work[6] = Work.create({name: 'Einsatzmittel- und Kostenplanung', project: project, parent: work[4], position: 2})
work[7] = Work.create({name: 'Projektüberwachung und -steuerung', project: project, parent: work[0], position: 3})
work[8] = Work.create({name: 'Projektcontrolling', project: project, parent: work[7], position: 1})
work[9] = Work.create({name: 'Inhalte-, Änderungs-, Risikomanagement', project: project, parent: work[7], position: 2})
work[10] = Work.create({name: 'Definition und Entwurf', project: project, parent: root, position: 2})
work[11] = Work.create({name: 'Funktionale Architektur', project: project, parent: work[10], position: 1})
work[12] = Work.create({name: 'Funktionen- und GUI-Modellierung', project: project, parent: work[11], position: 1, output_id: product[7].id})
work[13] = Work.create({name: 'Prozess- und Datenmodellierung', project: project, parent: work[11], position: 2, output_id: product[7].id})
work[14] = Work.create({name: 'Anwendungsarchitektur', project: project, parent: work[10], position: 2})
work[15] = Work.create({name: 'Komponenten auswählen und definieren', project: project, parent: work[14], position: 1})
work[16] = Work.create({name: 'Software-Systemarchitektur festlegen', project: project, parent: work[14], position: 2, output_id: product[6].id})
work[17] = Work.create({name: 'Implementierung Software', project: project, parent: root, position: 3})
work[18] = Work.create({name: 'Datenbankentwicklung', project: project, parent: work[17], position: 1})
work[19] = Work.create({name: 'Datenbankdesign', project: project, parent: work[18], position: 1})
work[20] = Work.create({name: 'Datenbankimplementierung', project: project, parent: work[18], position: 2})
work[21] = Work.create({name: 'Softwareentwicklung', project: project, parent: work[17], position: 2})
work[22] = Work.create({name: 'Komponentenentwicklung', project: project, parent: work[21], position: 1})
work[23] = Work.create({name: 'Komponententest und -integration', project: project, parent: work[21], position: 2})
work[24] = Work.create({name: 'Test', project: project, parent: work[17], position: 3})
work[25] = Work.create({name: 'Integrationstest', project: project, parent: work[24], position: 1})
work[26] = Work.create({name: 'Lasttest', project: project, parent: work[24], position: 2})

resource = Array.new

resource[0] = Resource.create({name: 'Projektleiter', group: 0, project: project, qualification: 'PMP', experience: '>3 Projektleitungen', fte: 1, position: 1})
resource[1] = Resource.create({name: 'Projektcontroller', group: 0, project: project, qualification: 'Project Mgmt. Certifcate', experience: 'Junior', fte: 1, position: 2})
resource[2] = Resource.create({name: 'Geschäftsanalytiker', group: 0, project: project, qualification: 'Business Analyst Certificate', experience: '>3 Jahre Product Management', fte: 1, position: 3})
resource[3] = Resource.create({name: 'Systemanalytiker', group: 0, project: project, qualification: 'System Analyst Certificate', experience: '>3 Jahre Software Engineering', fte: 1, position: 4})

resource[4] = Resource.create({name: 'Entwicklungsleiter', group: 1, project: project, qualification: 'Level 400 Softw. Eng. Cert.', experience: '>6 Jahre', fte: 1, position: 1})
resource[5] = Resource.create({name: 'Technischer Architekt', group: 1, project: project, qualification: 'Level 400 Softw. Eng. Cert', experience: '>6 Jahre', fte: 1, position: 2})
resource[6] = Resource.create({name: 'Datenbankentwickler LVL1', group: 1, project: project, qualification: 'Level 200 Database Eng. C.', experience: nil, fte: 2, position: 3})
resource[7] = Resource.create({name: 'Datenbankentwickler LVL2', group: 1, project: project, qualification: 'Level 300 Database Eng. C.', experience: '>3 Jahre', fte: 2, position: 4})
resource[8] = Resource.create({name: 'Softwareentwickler LVL1', group: 1, project: project, qualification: 'Level 200 Softw. Eng. Cert.', experience: '', fte: 1, position: 5})
resource[9] = Resource.create({name: 'Softwareentwickler LVL2', group: 1, project: project, qualification: 'Level 300 Softw. Eng. Cert.', experience: '>3 Jahre', fte: 3, position: 6})
resource[10] = Resource.create({name: 'Softwareentwickler LVL1', group: 1, project: project, qualification: 'Level 400 Softw. Eng. Cert.', experience: '>6 Jahre', fte: 3, position: 7})
resource[11] = Resource.create({name: 'Netzwerkentwickler LVL2', group: 1, project: project, qualification: 'Level 200 Network Admin C.', experience: '', fte: 1, position: 8})
resource[12] = Resource.create({name: 'Netzwerkentwickler LVL3', group: 1, project: project, qualification: 'Level 300 Network Admin C.', experience: '>3 Jahre', fte: 1, position: 9})
resource[13] = Resource.create({name: 'Operator LVL1', group: 1, project: project, qualification: 'Level 300 Data Center Ops C.', experience: '>3 Jahre', fte: 1, position: 10})
resource[14] = Resource.create({name: 'Operator LVL2', group: 1, project: project, qualification: 'Level 400 Data Center Ops C.', experience: '>6 Jahre', fte: 1, position: 11})

work[2].add_resource(resource[2], 1)
work[3].add_resource(resource[2], 1)
work[5].add_resource(resource[0], 1)
work[6].add_resource(resource[0], 1)
work[6].add_resource(resource[1], 1)
work[8].add_resource(resource[1], 1)
work[9].add_resource(resource[0], 1)
work[12].add_resource(resource[2], 1)
work[13].add_resource(resource[3], 1)
work[15].add_resource(resource[5], 1)
work[16].add_resource(resource[5], 1)
work[19].add_resource(resource[6], 1)
work[20].add_resource(resource[7], 1)
work[22].add_resource(resource[8], 1)
work[23].add_resource(resource[9], 1)
work[25].add_resource(resource[0], 1)
work[26].add_resource(resource[0], 1)

Effort.create({work: work[2], method: 0, name: 'Hans', estimation: 4})
Effort.create({work: work[2], method: 0, name: 'Peter', estimation: 5.5})
Effort.create({work: work[3], method: 0, name: 'Hans', estimation: 10})
Effort.create({work: work[3], method: 0, name: 'Peter', estimation: 8.5})
Effort.create({work: work[5], method: 0, name: 'Hans', estimation: 15})
Effort.create({work: work[5], method: 0, name: 'Peter', estimation: 20})
Effort.create({work: work[6], method: 0, name: 'Hans', estimation: 3})
Effort.create({work: work[6], method: 0, name: 'Peter', estimation: 3.5})
Effort.create({work: work[8], method: 0, name: 'Hans', estimation: 7})
Effort.create({work: work[8], method: 0, name: 'Peter', estimation: 5})
Effort.create({work: work[9], method: 0, name: 'Hans', estimation: 10})
Effort.create({work: work[9], method: 0, name: 'Peter', estimation: 10})
Effort.create({work: work[12], method: 0, name: 'Hans', estimation: 22})
Effort.create({work: work[12], method: 0, name: 'Peter', estimation: 30})
Effort.create({work: work[13], method: 0, name: 'Hans', estimation: 11.5})
Effort.create({work: work[13], method: 0, name: 'Peter', estimation: 13.5})
Effort.create({work: work[15], method: 0, name: 'Hans', estimation: 15})
Effort.create({work: work[15], method: 0, name: 'Peter', estimation: 15.5})
Effort.create({work: work[16], method: 0, name: 'Hans', estimation: 3})
Effort.create({work: work[16], method: 0, name: 'Peter', estimation: 3.5})
Effort.create({work: work[19], method: 0, name: 'Hans', estimation: 8})
Effort.create({work: work[19], method: 0, name: 'Peter', estimation: 9.5})
Effort.create({work: work[20], method: 0, name: 'Hans', estimation: 3})
Effort.create({work: work[20], method: 0, name: 'Peter', estimation: 3})
Effort.create({work: work[22], method: 0, name: 'Hans', estimation: 40})
Effort.create({work: work[22], method: 0, name: 'Peter', estimation: 46.5})
Effort.create({work: work[23], method: 0, name: 'Hans', estimation: 35})
Effort.create({work: work[23], method: 0, name: 'Peter', estimation: 37.5})
Effort.create({work: work[25], method: 0, name: 'Hans', estimation: 15})
Effort.create({work: work[25], method: 0, name: 'Peter', estimation: 17})
Effort.create({work: work[26], method: 0, name: 'Hans', estimation: 10})
Effort.create({work: work[26], method: 0, name: 'Peter', estimation: 8})

Effort.create({work: work[2], method: 1, estimation: 10})
Effort.create({work: work[2], method: 2, estimation: 5})
Effort.create({work: work[2], method: 3, estimation: 3})
Effort.create({work: work[3], method: 1, estimation: 21})
Effort.create({work: work[3], method: 2, estimation: 17})
Effort.create({work: work[3], method: 3, estimation: 15})
Effort.create({work: work[5], method: 1, estimation: 9})
Effort.create({work: work[5], method: 2, estimation: 6})
Effort.create({work: work[5], method: 3, estimation: 5})
Effort.create({work: work[6], method: 1, estimation: 30})
Effort.create({work: work[6], method: 2, estimation: 26})
Effort.create({work: work[6], method: 3, estimation: 24})
Effort.create({work: work[8], method: 1, estimation: 20})
Effort.create({work: work[8], method: 2, estimation: 15})
Effort.create({work: work[8], method: 3, estimation: 8})
Effort.create({work: work[9], method: 1, estimation: 12})
Effort.create({work: work[9], method: 2, estimation: 9})
Effort.create({work: work[9], method: 3, estimation: 8})
Effort.create({work: work[12], method: 1, estimation: 50})
Effort.create({work: work[12], method: 2, estimation: 43})
Effort.create({work: work[12], method: 3, estimation: 38})
Effort.create({work: work[13], method: 1, estimation: 20})
Effort.create({work: work[13], method: 2, estimation: 16})
Effort.create({work: work[13], method: 3, estimation: 14})
Effort.create({work: work[15], method: 1, estimation: 12})
Effort.create({work: work[15], method: 2, estimation: 9})
Effort.create({work: work[15], method: 3, estimation: 8})
Effort.create({work: work[16], method: 1, estimation: 4})
Effort.create({work: work[16], method: 2, estimation: 3})
Effort.create({work: work[16], method: 3, estimation: 2})
Effort.create({work: work[19], method: 1, estimation: 15})
Effort.create({work: work[19], method: 2, estimation: 10})
Effort.create({work: work[19], method: 3, estimation: 8})
Effort.create({work: work[20], method: 1, estimation: 15})
Effort.create({work: work[20], method: 2, estimation: 12})
Effort.create({work: work[20], method: 3, estimation: 5})
Effort.create({work: work[22], method: 1, estimation: 5})
Effort.create({work: work[22], method: 2, estimation: 3})
Effort.create({work: work[22], method: 3, estimation: 2})
Effort.create({work: work[23], method: 1, estimation: 4})
Effort.create({work: work[23], method: 2, estimation: 3})
Effort.create({work: work[23], method: 3, estimation: 2})
Effort.create({work: work[25], method: 1, estimation: 45})
Effort.create({work: work[25], method: 2, estimation: 36})
Effort.create({work: work[25], method: 3, estimation: 30})
Effort.create({work: work[26], method: 1, estimation: 14})
Effort.create({work: work[26], method: 2, estimation: 9})
Effort.create({work: work[26], method: 3, estimation: 7})

Milestone.create({project: project, name: 'Projektstart erfolgt', description: 'Das Projekt wurde gestartet.', start_at: Date.new(2014,1,10), end_at: nil})
Milestone.create({project: project, name: 'Ist-Analyse abgeschlossen', description: 'Die <b>Ist-Analyse</b> wurde abgeschlossen.', start_at: Date.new(2014,1,22), end_at: nil})
Milestone.create({project: project, name: 'Funktionale Architektur modelliert', description: 'Die <b>Funktionale Architektur</b> wurde modelliert.', start_at: Date.new(2014,1,30), end_at: nil})
Milestone.create({project: project, name: 'Anwendungsarchitektur modelliert', description: 'Die <b>Anwendungsarchitektur</b> wurde modelliert.', start_at: Date.new(2014,2,4), end_at: nil})
Milestone.create({project: project, name: 'Datenbank implementiert', description: 'Die <b>Datenbank</b> wurde in die Systemstruktur integriert.', start_at: Date.new(2014,2,10), end_at: nil})
Milestone.create({project: project, name: 'Integrationstests erfolgreich durchlaufen', description: 'Die <b>Integrationstests</b> wurden erfolgreich durchlaufen.', start_at: Date.new(2014,3,21), end_at: nil})
Milestone.create({project: project, name: 'Projekt abgeschlossen', description: 'Die Projekt <b>Web-Shop</b> wurden abgeschlossen.', start_at: Date.new(2014,4,10), end_at: nil})