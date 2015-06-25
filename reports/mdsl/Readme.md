# Report Pipeline

## Creating the reports

The reports depend on a template in 'template.md'. This
file has embedded ERb style string interpolations. E.g. Patient Name: >%= patiet_info.patient_name %> .
The input comes from a SQLite3 database in patient_info.sqlite3.
Run rake in this directory to create all the reports:


```
$ rake 
```

The output files will be labled MRN_{patient_info.mrn}.
There will be one file per record in the database.


## How it works:

- Redcarpet
- template.rb

## First Step: redcarpet

First,we create the file: template.html from the file: template.md.
This is done with the Redcrpet gem. It is used in the file 'redcarpet.rb'.



```
./redcarpet.rb template.md > template.html
```

## Second step: template.rb

Next we create all the MRN_99999.html files with 'template.rb'.
This file uses the sqlite3 gem and the code in lib/orm and models/patient_info.rb'
It runs a query: SELECT patient_name, date_of_birth, mrn, ... FROM patient_info'
That returns an array of PatientInfo objects.
Next, for each element in this array, we open a file named:
MRN_{patient_info.mrn}.html
Then we read in 'template.html' we created in the last step.
The ERb code interpolates the contents of the variable: patient_info and creates
the resulting string which is written to the MRN file.


