# INSTALLING (uncomment to install)
# install.packages('devtools')
#devtools::install_github("OHDSI/OhdsiSharing")
#devtools::install_github("OHDSI/FeatureExtraction")
#devtools::install_github("OHDSI/PatientLevelPrediction")
#devtools::install_github("ohdsi-studies/BipolarMisclassificationValidation")

library(BipolarMisclassificationValidation)
# USER INPUTS
#=======================
# minCellCount is a number (e.g., 0, 5 or 10) - this will
# remove any cell with a count less than minCellCount when packing the results to share
# you will have a complete copy of the results locally, but the results ready to
# share will have values less than minCellCount removed.
minCellCount <- 0

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

BipolarMisclassificationValidation::execute(connectionDetails = connectionDetails,
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
                                            minCellCount = minCellCount,
                                            sampleSize = NULL)
