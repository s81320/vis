# vis

Group work for data visualization

Data from kaggle: https://www.kaggle.com/karangadiya/fifa19

## changes to original kaggle data:

transform values
* monetary values for (at least) “Value”, “Wage” and "Release Clause": 
all currencies were in €, some as K€ some as M€ some as €, 
variable type: string
replace “M” by “000 K” and "K" by "000",  remove "." and “€”
parse as numerical
rename attributes oldName as oldName(Euro)

* Height originally in x'x format in feet'inches is transform to cm
type changed from nominal to numerical

* Weight originally in xlbs format is transformed to kg
type changed from nominal to numerical

## selection of attributes

Not all attributes from the sofifa / kaggle data are included. Removed:
Club Logo, Contract Valid until, Flag, Joined, Loaned from, Photo

## metadata
Kaggle did not provide any meta data to the data set. Same is true for the source of the data (sofifa.com)

Metadata collected as part of this project is placed in folder metadata.

## Handling of missing data

To do:
Goalkeepers have no values for field positions. Set them to 0
No Release Clause: set missing values to 0
No Club: Remove player / example 
