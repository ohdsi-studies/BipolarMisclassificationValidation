External Validation of Model Predicting Bipolar Misdiagnosed as MDD
=============

<img src="https://img.shields.io/badge/Study%20Status-Started-blue.svg" alt="Study Status: Started">

- Analytics use case(s): **Patient-Level Prediction**
- Study type: **Clinical Application**
- Tags: **-**
- Study lead: **Jenna Reps, Christophe Lambert**
- Study lead forums tag: **[[Jenna Reps]](https://www.ohdsi.org/who-we-are/collaborators/jenna-reps/) , [[Christophe Lambert]](https://www.ohdsi.org/who-we-are/collaborators/christophe-g-lambert/)**
- Study start date: **Jan 1, 2020**
- Study end date: **March 1, 2020**
- Protocol: **[Protocol](https://github.com/ohdsi-studies/BipolarMisclassificationValidation/blob/master/documents/ProtocolBipolarInMDD.docx)**
- Publications: **-**
- Results explorer: **-**

## Description

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

Execute the study by running the code in (extras/CodeToRun.R) :

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

Once you have sucessfully executed the study run the execute you will find a compressed folder in the location specified by '[outputFolder]/[databaseName]' named 'resultsToShare.zip'.  The study should remove sensitive data but we encourage researchers to also check the contents of this folder (it will contain a rds file with the results which can be loaded via readRDS('[file location]').  Please send the compressed folder results to [add S3 info].
