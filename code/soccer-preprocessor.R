preprocess <- function(io_dir, input_csv_name) {
  
  # directory and file exists check
  if (!dir.exists(io_dir)) {
    stop(
      paste0(
        "The provided input-output directory does not exist! (", io_dir, ")"
      )
    )
  }
  input_csv <- file.path(io_dir, input_csv_name, fsep=.Platform$file.sep)
  if (!file.exists(input_csv)) {
    stop(
      paste0(
        "The provided input_csv does not exist! (", input_csv, ")"
      )
    )
  }
  
  # installing and loading required packages
  if (!("stringr" %in% installed.packages())) {
    install.packages("stringr")
  }
  require(stringr)
  
  # reading unprocessed soccer data
  soccer.raw <- read.csv(
    file=input_csv,
    encoding = "UTF-8",
    stringsAsFactors=FALSE
  )
  
  # pre-processing
  
  
  
  # step-1 [features_removal]
  # remove columns - 
  # 1. serial ("X.U.FEFF"),
  # 2. "ID",
  # 3. "Photo",
  # 4. "Flag",
  # 5. "Club.Logo",
  # 6. "Real.Face",
  # 7. "Joined",
  # 8. "Loaned.From",
  # 9. "Contract.Valid.Until"
  
  # listing column names of unprocessed soccer data
  columns <- colnames(soccer.raw)
  
  removable_columns_indices <- c(
    which(columns=="X.U.FEFF."),
    which(columns=="ID"),
    which(columns=="Photo"),
    which(columns=="Flag"),
    which(columns=="Club.Logo"),
    which(columns=="Real.Face"),
    which(columns=="Joined"),
    which(columns=="Loaned.From"),
    which(columns=="Contract.Valid.Until")
  )
  soccer.preprocessed <- soccer.raw[, -removable_columns_indices]
  # remaining_columns=80
  
  
  
  # step-2 [conversion]
  # convert amount strings of "Value", "Wage", "Release.Clause" to numeric, 
  # e.g. €1M -> 1000000
  
  euro_string_to_euro_numeric <- function(euro_strings) {
    result <- str_match(euro_strings, "(€)(\\d+)(\\.)?(\\d+)?(M|K)?")[, c(3:6)]
    part1 <- result[, 1]
    part2 <- result[, 2]
    part3 <- result[, 3]
    part4 <- ifelse(result[, 4]=="M", 1e6, 1e3)
    part4[is.na(part4)] <- 1
    part0 <- paste0(
      ifelse(is.na(part1), "", part1),
      ifelse(is.na(part2), "", part2),
      ifelse(is.na(part3), "", part3)
    )
    part0 <- sapply(part0, as.numeric, USE.NAMES = FALSE)
    part0 * part4
  }
  columns <- colnames(soccer.preprocessed)
  amount_columns_indices <- c(
    which(columns=="Value"),
    which(columns=="Wage"),
    which(columns=="Release.Clause")
  )
  soccer.preprocessed[amount_columns_indices] <- apply(
    X=soccer.preprocessed[amount_columns_indices],
    MARGIN=2,
    FUN=euro_string_to_euro_numeric
  )
  
  
  
  # step-3 [conversion]
  # convert "Height" feet'inch values to cm
  # e.g. 5'7 (5 feet 7 inch) -> 170 (cm)
  
  feet_inches_to_cm <- function(heights_in_fi) {
    result <- apply(str_split(heights_in_fi, "'", simplify=TRUE), 2, as.numeric)
    result[, 1] <- sapply(result[, 1], function(x) x * 30.48)
    result[, 2] <- sapply(result[, 2], function(x) x * 2.54)
    result <- round(apply(result, 1, sum), 0)
  }
  soccer.preprocessed$Height <- feet_inches_to_cm(soccer.preprocessed$Height)
  
  
  
  # step-4 [conversion]
  # convert "Weight" lbs values to kg
  # e.g. 150lbs (150 pound) -> 68 (kg)
  
  pounds_to_kg <- function(weights_in_pound) {
    result <- str_replace_all(weights_in_pound, "lbs", "")
    result <- sapply(result, as.numeric, USE.NAMES=FALSE)
    result <- round(result * 0.4535924, 0)
  }
  soccer.preprocessed$Weight <- pounds_to_kg(soccer.preprocessed$Weight)
  
  
  
  # step-5 [conversion]
  # position-wise  scores in columns (e.g. "LS", "ST", "RS" ...) are in format x+y,
  # transformed to use only x value, removed +y, parsed into numerical value
  # e.g. "80+2" -> 80
  
  scores_to_flat_numeric <- function(scores) {
    sapply(str_match(scores, "(\\d{1,2})(?:\\+\\d{1})")[, 2], as.numeric, USE.NAMES=FALSE)
  }
  
  position_columns_indices <- c(
    which(columns=="LS"),
    which(columns=="ST"),
    which(columns=="RS"),
    which(columns=="LW"),
    which(columns=="LF"),
    which(columns=="CF"),
    which(columns=="RF"),
    which(columns=="RW"),
    which(columns=="LAM"),
    which(columns=="CAM"),
    which(columns=="RAM"),
    which(columns=="LM"),
    which(columns=="LCM"),
    which(columns=="CM"),
    which(columns=="RCM"),
    which(columns=="RM"),
    which(columns=="LWB"),
    which(columns=="LDM"),
    which(columns=="CDM"),
    which(columns=="RDM"),
    which(columns=="RWB"),
    which(columns=="LB"),
    which(columns=="LCB"),
    which(columns=="CB"),
    which(columns=="RCB"),
    which(columns=="RB")
  )
  soccer.preprocessed[position_columns_indices] <- apply(
    X=soccer.preprocessed[position_columns_indices],
    MARGIN=2,
    FUN=scores_to_flat_numeric
  )
  
  
  
  # step-6 [conversion]
  # converting to factor datatype for columns with catergorical values
  
  # 6a. setting the values with empty string in category type columns to NA
  columns <- colnames(soccer.preprocessed)
  factor_columns_indices <- c(
    which(columns=="Nationality"),
    which(columns=="Club"),
    which(columns=="Preferred.Foot"),
    which(columns=="Work.Rate"),
    which(columns=="Body.Type"),
    which(columns=="Position")
  )
  soccer.preprocessed[, factor_columns_indices][soccer.preprocessed[, factor_columns_indices] == ""] <- NA
  
  # 6b. converting to factor datatype
  soccer.preprocessed$Nationality <- as.factor(soccer.preprocessed$Nationality)
  soccer.preprocessed$Club <- as.factor(soccer.preprocessed$Club)
  soccer.preprocessed$Preferred.Foot <- as.factor(soccer.preprocessed$Preferred.Foot)
  soccer.preprocessed$Work.Rate <- as.factor(soccer.preprocessed$Work.Rate)
  soccer.preprocessed$Body.Type <- as.factor(soccer.preprocessed$Body.Type)
  soccer.preprocessed$Position <- as.factor(soccer.preprocessed$Position)
  
  
  
  # step-7 [missing_value_handling]
  # removing rows with missing value (NA) step wise
  
  # 7a. removing all rows missing "Height", "Weight", "Body.Type" etc.
  soccer.preprocessed <- soccer.preprocessed[!is.na(soccer.preprocessed$Height), ]
  # nrow(soccer.preprocessed)
  # remaining_rows = 18159
  
  # 7b. removing all rows missing "Position"
  soccer.preprocessed <- soccer.preprocessed[!is.na(soccer.preprocessed$Position), ]
  # nrow(soccer.preprocessed)
  # remaining_rows = 18147
  
  # 7c. removing all rows missing "Club"
  soccer.preprocessed <- soccer.preprocessed[!is.na(soccer.preprocessed$Club), ]
  # nrow(soccer.preprocessed)
  # remaining_rows = 17918
  
  # 7d. imputing positional columns values to zero (0) for players with "Position"=GK
  soccer.preprocessed[which(soccer.preprocessed$Position == "GK"), position_columns_indices] <- 0
  
  # 7e. imputing missing "Release.Clause" values with zero (0)
  soccer.preprocessed[which(is.na(soccer.preprocessed$Release.Clause)), which(columns=="Release.Clause")] <- 0
  
  
  
  # writing preprocessed soccer data to output
  output_csv_name <- "soccer-preprocessed.csv"
  output_csv <- file.path(io_dir, output_csv_name, fsep=.Platform$file.sep)
  write.csv(
    x=soccer.preprocessed,
    file=output_csv,
    fileEncoding="UTF-8",
    row.names=FALSE
  )
}

preprocess(
  io_dir="D:/msc-ds/course-resource/data-visualization/project",
  input_csv_name="soccer-data-kaggle.csv"
)
