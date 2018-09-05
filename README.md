# MediRecord

https://github.com/thehicksivist/Medirecord

#Program Description and Functionality:
MediRecord is a terminal application, designed for the use of patients and doctors to view medical records.
There are two types of users: Patients and Doctors
Patients are able to view their own records, current or historical.
Doctors have access to all patient records, and update their details, and create new user accounts.

#Details of design & planning process:

BRAINSTORMING IDEAS:

Travel info app

	* ask where the person is
	* where do they want to go
	* what means do they want to travel by car, train, plane
	* how long it would take
	* ask for booking
	* ask for price

Weather app

	* ask where they want to know the weather
	* display temperature, rain, cloud, conditions
	* retrieve info from web api

Investment app

	* crypto prices
	* add funds
	* track prices
	* track investment

Medical records

	* doctor and patients login
	* doctors can view and edit records
	* patients can only view records
	* if new patient, ask to see a doctor - is it an emergency? (call 000)
	* patient details; name, age, height, weight

Get to 100 puzzle game

	* pick x numbers that add to 100
	* you cannot type the same number
	* scale levels - 2 numbers, 3 numbers, 4 numbers

Monsters on Mars

	* walk a direction/ drone/ rover N/S/E/W
	* search for alien monsters, if found;
	* list description of new species and store them in a library
	* monsters have x legs, arms, heads, eyes, mouths, colours
	* you can hear sounds or see something in the distance indicating where a monster is
	* 'zapp' as many alien monsters as possible in 1 minute
	* at the end, show list of monsters 'zapped'


IDEA SHORTLIST AND RESEARCH:

Travel Info App - need gem to determine distance between locations
monster game - need gem to display map with player location and monster locations
medical records - already have encrypt/ decrypt code, seems a more feasible idea


PLANNING STAGE:

MediRecord: features

	* first screen: emergency, patient and doctor logins
	* patient login: view medical record (current, historical)
	* doctor login: create patient or select patient > view current record, edit current record
	* patient record categories: name, age, weight, height, ethnicity, religion, ailment (if any) treatment (if any)
	* ailment types (e.g flu, broken bone, cut, bruise, allergy)
	* treatment types: (e.g rest, medication, surgery, rehab)

Optional Features

	* payments
	* medicare/concession
	* amount of rest days
	* doctors notes - print
	* record category: allergies or aversions to medications/ treatment types (first priority!)
	* patient location
	* doctor specialties

Build order: (TDD considered)

	* Patient record structure (30mins)
	* Patient and Doctor Logins (1hr)
	* first page/ login (30mins)
    * Patient view records (2hrs)
	* Doctor view+editing records (2hrs)
    * Doctor creating users (1hr)
	* Implemention of optional features

#app User/Workflow diagram
![App User/ Workflow Diagram](docs/UserWorkflowDiagram.png)

#Screenshots of Trello board(s)
