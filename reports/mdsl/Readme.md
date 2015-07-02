# Report Pipeline

## Abstract

Reports on patient lab results are generatedin this directory. The data comes from
a SQLite3 database. Several tools are used to extract the data, format the results
and then generate PDF reports.
The following tools are used: 


- Redcarpet - Github Flavored Markdown Processor
- SQLite3 - Database Engine
- ERb - Ruby Templating Engine
- Wkhtmltopdf - PDF Generator

These tools are discussed in this document.

## Installation

Installation of 'wkhtmltopdf' for PDF generation should be from latest binary package.
The current ubuntu-trusty64 .deb is in this folder: reports/
The dependencies can be installed with the file: how.to.install.wkhtmltopdf.from.deb


The data source is in the SQLite3 database: patient_info.sqlite3
You should install the SQLite3 client: 'sqlite3' to work with the DB.
And you must install the Ruby Gem: sqlite3
Here are the current installation instructions:


```
./how.to.install.wkhtmltopdf.from.deb
$ sudo apt-get install sqlite3
$ bundle # in docker/ root

```

## Creating the reports

The reports depend on a template in 'template.md'. This
file has embedded ERb style string interpolations. E.g. Patient Name: >%= patiet_info.patient_name %> .
The input comes from a SQLite3 database in patient_info.sqlite3.
Run rake in this directory to create all the reports:


```
$ rake 
```

The output files will be labled MRN_{patient_info.mrn}.html, .pdf
There will be 2 files per record in the database.
One .html and one .pdf.


## How it works:

- Redcarpet
- template.rb
- wkhtmltopdf

### First Step: redcarpet

First,we create the file: template.html from the file: template.md.
This is done with the Redcrpet gem. It is used in the file 'redcarpet.rb'.



```
./redcarpet.rb template.md > template.html
```

### Second step: template.rb

Next we create all the MRN_99999.html files with 'template.rb'.
This file uses the sqlite3 gem and the code in lib/orm and models/patient_info.rb'
(See the file: Object Relation Model - Orm.md. Which discusseshow the Ruby code works.)
It runs a query: SELECT patient_name, date_of_birth, mrn, ... FROM patient_info'
That returns an array of PatientInfo objects.
Next, for each element in this array, we open a file named:
MRN_{patient_info.mrn}.html
Then we read in 'template.html' we created in the last step.
The ERb code interpolates the contents of the variable: patient_info and creates
the resulting string which is written to the MRN file.


Here is an example of running this program:

```
./template.rb
```

This assumes the template is in ./template.html. Which is what the output 
of redcarpet.rb

To use some other template:

```
./template.rb --template othertemplate.html
```

Use -./template.rb -h to see a list of other options. You can 
filter based on a patient name or MRN number

### Third step: wkhtmltopdf

To create the PDFs from the HTML files, we use the program 'wkhtmltopdf'.
The correct (and current) options are supplied in the wrapper: 'dowk.sh'
This script expects 2 additional files: page.css and header.html
page.css adds page breaks for every div elements with class="page".
header.html contains the header file that will be inserted at the top of every page.


