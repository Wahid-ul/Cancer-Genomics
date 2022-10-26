Input File :

Breast cancer

gbsg: Breast cancer data sets used in Royston and Altman (2013)

Description

The gbsg data set contains patient records from a 1984-1989 trial conducted by the German Breast Cancer Study Group (GBSG) of 720 patients with 
node positive breast cancer; 
it retains the 686 patients with complete data for the prognostic variables.
A data set with 686 observations and 11 variables.

Format:
pid - patient identifier

**age**  -age, years

**meno**  -menopausal status (0= premenopausal, 1= postmenopausal

**size**   -tumor size, mm
    
   **T1**: The tumor in the breast is 20 millimeters (mm) or smaller in size at its widest area. This is a little less than an inch. 
   This stage is then broken into 4 substages depending on the size of the tumor:

                              T1mi is a tumor that is 1 mm or smaller.

                              T1a is a tumor that is larger than 1 mm but 5 mm or smaller.

                              T1b is a tumor that is larger than 5 mm but 10 mm or smaller.

                              T1c is a tumor that is larger than 10 mm but 20 mm or smaller.

   **T2**: The tumor is larger than 20 mm but not larger than 50 mm.

   **T3**: The tumor is larger than 50 mm.

**grade**   -tumor grade

**nodes**    -number of positive lymph nodes

   **N1**: The cancer has spread to 1 to 3 axillary lymph nodes and/or the internal mammary lymph nodes. 
   If the cancer in the lymph node is larger than 0.2 mm but 2 mm or smaller, it is called "micrometastatic" (N1mi).

   **N2**: The cancer has spread to 4 to 9 axillary lymph nodes. Or, it has spread to the internal mammary lymph nodes, but not the axillary lymph nodes.

   **N3**: The cancer has spread to 10 or more axillary lymph nodes, or it has spread to the lymph nodes located under the clavicle, or collarbone

**pgr**      -progesterone receptors (fmol/l)

**er**       -estrogen receptors (fmol/l)

**hormon**    -hormonal therapy, 0= no, 1= yes

**rfstime**   -recurrence free survival time; days to first of reccurence, death or last follow-up

**status**    -0= alive without recurrence, 1= recurrence or death

**References**
Patrick Royston and Douglas Altman, External validation of a Cox prognostic model: principles and methods. BMC Medical Research Methodology 2013, 13:33
