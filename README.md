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

* TO DO: Body type has three possible values in Kaggle data: lean, stocky, normal ... and some exceptions: Messi, Ronaldo and XY constitute their own body type. This should be changed. There are about 3 other strange values that have to be assigned one of the original clases.

* Field positions evaluation / scoring in attributes LS, ST, RS, ... is in format x+y with y ranging from 2 to 5.
transformed to use only x value, removed +y, parsed into numerical value.

TO DO ** TO DO ** TO DO ** TO DO

Body type for Messi, Ronaldo and Neymar is ... their own name. There are abut three more of these ecxceptions. These players should not be removed, but they should be sorted into the correct body type. Question: What is the correct body type for Messi, Ronaldo and Neymar?? What is the best algorithm for this problem??

## selection of attributes , removed attributes

Not all attributes from the sofifa / kaggle data are included. Removed:
* Club Logo
* Contract Valid until
* Flag
* Joined
* Loaned from
* Photo
* Real Face

Since the project is about visualizations, I can include flag, photo, club logo (And make sure these attributes are used for visualisation only and not for classification ...)

## metadata
Kaggle did not provide any meta data to the data set. Same is true for the source of the data (sofifa.com)

Metadata collected as part of this project is placed in folder metadata.

## Handling of missing data

* Goalkeepers had no values for field positions. Set them to 0
* No Release Clause: set missing values to 0
