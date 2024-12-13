Methodology Neighbourhood:
•	Tobias Käcks created an R script for calculating the coordinates of the neighbouring trees and shrubs, which I adjusted for my input data “Coordinates_China_2024.R”
•	The order (number of tree and shrub) were not correct, but the coordinates were. Therefore, the columns were just swapped so that the number of tree/shrub were in order
•	On the first day at Site A, I had not done the neighbourhood identifications yet, so I had not finalised a protocol. Therefore, not all the tree coordinates I needed to identify the species at were included. Mr Qi (Chinese worker) and I wrote down 9 but not all 12. We did not use the sheet with coordinates yet. Therefore, for these plots, Tobias P8G redid the tree neighbourhood when he went to Site A for the loggers. We used his data for these.
These plots were D32, D33, G31, H30, F35 and C33
•	We did, however, do all the shrubs in these plots
•	From the second day (27.08.2024), started to use the sheets (“Shrub neighbourhood field sheet.docx” and “Tree neighbourhood field sheet.docx” created by the R.code for the coordinates of the shrubs and trees of each TSQ and wrote the species (code) of the shrub/tree at the coordinate. Tree/shrubs that were missing or dead were also noted accordingly. This was done by my worker Qiufang, as she is very experienced with the species in Site A.
•	For the shrub only plots (controls), the coordinates were not on the sheet from the code, therefore, these were noted in the fieldbook (those present were identified and it was noted if there were dead ones. The rest were missing)
•	Tobias was responsible for doing the neighbourhoods at Site B
•	When entering the data, the number of species alive/present in the neighbourhood were counted and entered into a column ‘density’ in Excel
•	Some other changes were made during the entering of the data:
-	G31, 1908: Neighbouring shrub 1808- in the field notes, we wrote MaTh, but this is a tree, NOT a shrub. Therefore, this was changed to ‘Unknown’
-	Plot I29, 0208: neighbouring shrub 0207: the species was no longer legible, therefore, it was also changed to ‘Unknown’. This is because it was written in pencil first and due to the wet vegetation and sweat, it was smudged
-	Plot L11, 1812: Tobias had 2 sets of coordinates/species for the neighbouring trees. We selected the set with higher number of living/present trees as it is possible to miss a tree (i.e. write missing) but unlikely to identify a species that is not there
-	Plot T22/U22, 1915: DiGI was changed/corrected to DiJa
-	Plot M22, 0402: was changed to ElCh
-	Plot M22, 0102:  was corrected to ElJa
Also, Plot H29, 1319: coordinate 1200 wozuld belong to neighbouring plot, but still a neighbour

The final Excel sheets were:
•	“Site A_neighbourhood trees Final. xlsx” = neighbouring trees around the TSQ in Site A, from 2023
•	“Site A_TSQ_neighbourhood_shrub.xlsx”= neighbouring shrubs around the TSQs in Site A, from 2023
•	“Site_B_TSQ_neighborhoods_2024.xlsx”= both the shrub and the tree neighbourhood for each TSQ, from Site B from 2024 – received from Tobi

These sheets were then reformatted to be uploaded into R for analyses:

For both Site A and B, the original excel sheets were duplicated and in the copies, the shrub coordinates and the plot number were duplicated, to have them in both rows (coordinates and species of neighbours). The row with coordinates was then removed.
•	Site A new sheets: “Site A tree neighbourhood R.xlsx” and “Site A shrub neighbourhood R.xlsx”
For Site B, all “Missing” were replaced with “M” and all “Dead” were replaced with “D”. Furthermore, R28, 1010 was measured twice, therefore, I used the first one and removed the second, which was written in red
•	Site B new sheets: “Site B tree neighbourhood R.xlsx” and “Site B shrub neighbourhood R.xlsx”

To see what was done in R Studio, view "Neighbourhood diversity and density.ipynb"

For Site A, there were counted densities from data entering and then densities calculated in R: these were compared. The errors were searched in both the tree and shrub neighbourhood tables in R, and then also compared to all the TSQs in the Site.
This showed three inconsistencies in the trees:
Plot Q20, shrub coordinate 0205: 8 vs 9 (9 was correct, therefore it was a miscount)
Plot N13, shrub coordinate 0808: 9 vs 8 (miscount)
D33, 0407: 4 vs 5 = here the 4 was correct. Tree 12 (N12) was labelled DeaD but should be NA, therefore this was corrected
And three inconsistencies in the shrubs, which were all as a result of miscounting during data entry:
N14, 0415: 0 vs 1
M19, 0102: 4 vs 5
H29, 0205: 4 vs 5
•	For further analyses, the manually counted and entered values were ignored and the R outputs were used
•	All individuals labelled unknown (that could not be identified) must be included in the density (i.e. present) but ignored for diversity (as it could be a species that is already included and would thus be an overestimate)
It was noticed that the tree and shrub neighbourhoods were not equal in the number of observations for Site A. The differences in these vectors was calculated. The major inconsistencies were due to the NO SHRUB plots (controls): L19, H29 and M19
However, two other errors occurred during the reformatting of the excel sheets. Therefore, these were corrected and re-uploaded and rerun:
I19, 0208 was changed to I29 in the shrub neighbourhood sheet
Q20, 0409 was changed to 0419 in the tree neighbourhood sheet

For Site B: the NAs were counted as observations, therefore both vectors were the same length, however, not consisting of the same coordinates:
M8 1717: This was incorrectly labelled in the tree neighbourhood sheet as N8, but was corrected
U29 (1111, 1003, 1116) : was changed in shrub neighbourhood sheet to U19
O26 1716: changed in the tree neighbourhood sheet from 1706 to 1716
T22 1915: In the shrub neighbourhood table it was changed from T22 to T22/U22
