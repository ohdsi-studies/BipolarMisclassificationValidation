External Validation of Model Predicting Bipolar Misdiagnosed as MDD
=============

<img src="https://img.shields.io/badge/Study%20Status-Design%20Finalized-brightgreen.svg" alt="Study Status: Design Finalized">

- Analytics use case(s): **Patient-Level Prediction**
- Study type: **Clinical Application**
- Tags: **-**
- Study lead: **Jenna Reps, Christophe Lambert**
- Study lead forums tag: **[jreps](https://forums.ohdsi.org/u/jreps) , [Christophe_Lambert](https://forums.ohdsi.org/u/Christophe_Lambert)**
- Study start date: **Jan 1, 2020**
- Study end date: **April 1, 2020**
- Protocol: **[Protocol](https://github.com/ohdsi-studies/BipolarMisclassificationValidation/blob/master/documents/ProtocolBipolarInMDD.docx)**
- Publications: **-**
- Results explorer: **-**

This study applies and evaluates a simple score model to OMOP CDM data that predicts which newly diagnosed MDD patients will be diagnosed with bipolar within the next 3 years  


## Code to Install

To install this package run :

```r
  # install the network package
  # install.packages('devtools')
  devtools::install_github("OHDSI/OhdsiSharing")
  devtools::install_github("OHDSI/FeatureExtraction")
  devtools::install_github("OHDSI/PatientLevelPrediction")
  devtools::install_github("ohdsi-studies/BipolarMisclassificationValidation")
```

## Code to Run

Execute the study by running the code in (extras/CodeToRun.R) but update using your database configuration and settings:

```r
library(BipolarMisclassificationValidation)
# USER INPUTS
#=======================
# The folder where the study intermediate and result files will be written:
outputFolder <- "./bipolarValidationResults"

# Specify where the temporary files (used by the ff package) will be created:
options(fftempdir = "location with space to save big data")

# Details for connecting to the server:
dbms <- "you dbms"
user <- 'your username'
pw <- 'your password'
server <- 'your server'
port <- 'your port'

connectionDetails <- DatabaseConnector::createConnectionDetails(dbms = dbms,
                                                                server = server,
                                                                user = user,
                                                                password = pw,
                                                                port = port)

# Add the database containing the OMOP CDM data
cdmDatabaseSchema <- 'cdm database schema'
# Add a sharebale name for the cdmDatabaseSchema database
databaseName <- 'Validation Data Name'
# Add a database with read/write access as this is where the cohorts will be generated
cohortDatabaseSchema <- 'work database schema'

oracleTempSchema <- NULL

# table name where the cohorts will be generated
cohortTable <- 'bipolarValidationCohort'
#=======================

execute(connectionDetails = connectionDetails,
        cdmDatabaseSchema = cdmDatabaseSchema,
        cohortDatabaseSchema = cohortDatabaseSchema,
        cohortTable = cohortTable,
        outputFolder = outputFolder,
        databaseName = databaseName,
        oracleTempSchema = oracleTempSchema,
        viewModel = F,
        createCohorts = T,
        runValidation = T,
        packageResults = T,
        minCellCount = 5,
        sampleSize = NULL)
```

## Submitting Results

Once you have sucessfully executed the study run the execute you will find a compressed folder in the location specified by '[outputFolder]/[databaseName]' named '[databaseName].zip'.  The study should remove sensitive data but we encourage researchers to also check the contents of this folder (it will contain a rds file with the results which can be loaded via readRDS('[file location]').  Please send the compressed folder results to [add S3 info].

## Result object
After running the study you will get an rds object saved to:
'[outputFolder]/[databaseName]/[databaseName]/validationResults.rds' you can load this object using the R function readRDS:
```r
result <- readRDS('[outputFolder]/[databaseName]/[databaseName]/validationResults.rds')
```

the 'result' object is a list containing the following:

```{r echo=FASLE, results ='axis'}
library(knitr)
data<- rbind(
c('result$inputSetting', 'The outcome and cohort ids and the databaseName', 'No'),
c('result$executionSummary', 'Information about the R version, PatientLevelPrediction version and execution platform info', 'No'),
c('result$model', 'Information about the model (name and type)', 'No'),
c('result$analysisRef', 'Used to store a unique reference for the study', 'No'),
c('result$covariateSummary', 'A dataframe with summary information about how often the covariates occured for those with and without the outcome', 'Yes'),
c('result$spline', 'Fit and plot of cox regression for predicted risk ~ outcome over 10 years', 'Yes'),
c('result$scoreThreshold', 'Operating characteristics per score','Yes'), 
c('result$survInfo', 'Dataframe containing the surivial plot data per 30 day window per risk score - number surviving, number censored and number with outcome','Yes'), 
c('result$yauc', 'The AUC when restricted the data per year of target cohort start', 'Yes'),
c('result$performanceEvaluation$evaluationStatistics', 'Performance metrics and sizes', 'No'),
c('result$performanceEvaluation$thresholdSummary', 'Operating characteristcs @ 100 thresholds', 'Yes'),
c('result$performanceEvaluation$demographicSummary', 'Calibration per age group', 'Yes'),
c('result$performanceEvaluation$calibrationSummary', 'Calibration at risk score deciles', 'Yes'),
c('result$performanceEvaluation$predictionDistribution', 'Distribution of risk score for those with and without the outcome', 'Yes')
)
data <- as.data.frame(data)
colnames(data) <- c('Object','Description','Edited by minCellCount')
kable(data, caption ='The results R list components')
```

After running execute() with packageResults = T you will get the sharable results as:
'[outputFolder]/[databaseName]/[databaseName].zip' and the corresponding contents are at:
```r
result <- readRDS('[outputFolder]/[databaseName]/[databaseName]/resultsToShare/validationResults.rds')
```
This will be the same obejct as before but any cell counts less than minCellCount are replaced by -1 and if you specified a minCellCount >0 then 'result$survInfo' will be removed.



