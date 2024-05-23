#' Exam data
#'
#' Data on two exam scores for 77 university students
#'
#' @format ## `exams`
#' A data frame with 77 rows and 2 columns:
#' \describe{
#'   \item{exam1}{Score (out of 100) on the first exam}
#'   \item{exam2}{Score (out of 100) on the second exam}
#' }
"exams"

#' Current Population Survey (CPS) data
#'
#' A subsample of the 2019 Current Population Survey (CPS) consisting of
#' data on individuals aged 30 to 59 (inclusive)
#'
#' @format ## `cps`
#' A data frame with 4,013 rows and 17 columns:
#' \describe{
#'   \item{statefips}{Two-character state code, including DC}
#'   \item{gender}{Gender (Male, Female)}
#'   \item{metro}{Metropolitan-area (Metro, Non-Metro)}
#'   \item{race}{Race category (Black, White, Other)}
#'   \item{hispanic}{Hispanic (Hispanic, Non-hispanic)}
#'   \item{marstatus}{Marital status (Married, Divorced, Widowed, Never married)}
#'   \item{lfstatus}{Labor-force status (Employed, Unemployed, Not in LF)}
#'   \item{ottipcomm}{Earnings include overtime, tips, and/or commissions (Yes, No)}
#'   \item{hourly}{Hourly-worker status (Hourly, Non-hourly)}
#'   \item{unionstatus}{Union status (Union, Non-union)}
#'   \item{age}{Age (in years)}
#'   \item{hrslastwk}{Hours worked last week}
#'   \item{unempwks}{Number of weeks unemployed}
#'   \item{wagehr}{Hourly wage (in dollars); only for hourly employees}
#'   \item{earnwk}{Earnings last week (in dollars)}
#'   \item{ownchild}{Number of children in household}
#'   \item{educ}{Highest education level attained (in years)}
#' }
#' @source <https://www.census.gov/programs-surveys/cps/data/datasets.html>
"cps"

#' State-level cigarette price and tax data
#'
#' Data on cigarette prices and taxes in 2019 for the 50 U.S. states plus the
#' District of Columbia
#'
#' @format ## `cigdata`
#' A data frame with 51 rows and 9 columns:
#' \describe{
#'   \item{state}{State abbreviation}
#'   \item{statename}{State name}
#'   \item{price_pack}{Average price per pack (in dollars)}
#'   \item{pack_sales_per_capita}{Annual sales, packs per capita}
#'   \item{totaltax_pct}{Total tax (federal plus state) per pack, as percent of pack price}
#'   \item{totaltax_pack}{Total tax (federal plus state) per pack (in dollars)}
#'   \item{cig_tax_revnue}{Total annual tax revenue (in dollars)}
#'   \item{producer}{1 if tobacco production > 20m pounds, 0 otherwise}
#' }
#' @source <https://healthdata.gov/dataset/The-Tax-Burden-on-Tobacco-1970-2019/etts-u9ii>
"cigdata"

#' Monthly returns data for S&P 500 companies
#'
#' Data on monthly returns for S&P 500 companies between Jan 1991 and Apr 2021
#'
#' @format ## `sp500`
#' A data frame with 364 rows and 268 columns:
#' \describe{
#'   \item{Date}{Date, as a string, indicating the endpoint of the month}
#'   \item{IDX}{Monthly return for the S&P 500 index}
#'   \item{AAPL, ABMD, ..., ZION}{Monthly company returns, where variable name is the company stock ticker symbol}
#' }
#' @source <https://finance.yahoo.com>
"sp500"

#' Hypothetical data for widgets.com website
#'
#' Data on purchases for an e-mail experiment run by widgets.com
#'
#' @format ## `widgets`
#' A data frame with 3,000 rows and 4 columns:
#' \describe{
#'   \item{emailA}{1 if customer receives e-mail A, 0 otherwise}
#'   \item{emailB}{1 if customer receives e-mail B, 0 otherwise}
#'   \item{purchase}{1 if customer makes a purchase, 0 otherwise}
#'   \item{amount}{Total purchase (in dollars)}
#' }
"widgets"

#' Birth outcome data
#'
#' Data on birth outcomes in the United States for December 2021 births where
#' mother's age is between 25 and 35 (inclusive), limited to singleton births,
#' mother's first child, and having non-missing values for relevant variables
#'
#' @format ## `births`
#' A data frame with 50,249 rows and 20 columns:
#' \describe{
#'   \item{birthtime}{Birth time during day (in minutes, range is 0 to 2399)}
#'   \item{birthwkday}{Day of week of birth (1=Sunday, 2=Monday, ..., 7=Saturday)}
#'   \item{age}{Mother's age (in years)}
#'   \item{nonhsgrad}{1 if mother is not a HS graduate, 0 otherwise}
#'   \item{hsgrad}{1 if mother is HS graduate and has no add'l education, 0 otherwise}
#'   \item{somecoll}{1 if mother completed some college, 0 otherwise}
#'   \item{collgrad}{1 if mother is 4-year college graduate, 0 otherwise}
#'   \item{married}{1 if mother is married, 0 otherwise}
#'   \item{smoke1}{1 if mother smoked during first trimester, 0 otherwise}
#'   \item{smoke2}{1 if mother smoked during second trimester, 0 otherwise}
#'   \item{smoke3}{1 if mother smoked during third trimester, 0 otherwise}
#'   \item{smokepre}{1 if mother smoked before pregnancy, 0 otherwise}
#'   \item{smoke}{1 if mother smoked during pregnancy (any trimester), 0 otherwise}
#'   \item{prenatal1}{1 if first prenatal care during first trimester, 0 otherwise}
#'   \item{prenatal2}{1 if first prenatal care during second trimester, 0 otherwise}
#'   \item{prenatal3}{1 if first prenatal care during third trimester, 0 otherwise}
#'   \item{nocare}{1 if no prenatal care visit, 0 otherwise}
#'   \item{male}{1 if baby is a boy, 0 otherwise}
#'   \item{bweight}{Birthweight (in grams)}
#'   \item{bweight_lbs}{Birthweight (in pounds)}
#' }
#' @source <https://www.nber.org/research/data/vital-statistics-natality-birth-data>
"births"

#' Bitcoin price and returns data
#'
#' Data on daily prices and returns for Bitcoin during 2020 and 2021
#'
#' @format ## `bitcoin`
#' A data frame with 364 rows and 268 columns:
#' \describe{
#'   \item{date}{Date}
#'   \item{high}{Highest price (in dollars)}
#'   \item{low}{Lowest price (in dollars)}
#'   \item{close}{End-of-day price (in dollars)}
#'   \item{return}{Daily return, based on end-of-day prices}
#' }
#' @source <https://finance.yahoo.com>
"bitcoin"

#' Baseball attendance data
#'
#' Data on 2022 attendance for Major League Baseball teams
#'
#' @format ## `baseball`
#' A data frame with 30 rows and 9 columns:
#' \describe{
#'   \item{team}{Team name}
#'   \item{attend_home}{Average home game attendance}
#'   \item{attend_road}{Average road game attendance}
#'   \item{winpct_22}{Team winning percentage in 2022}
#'   \item{winpct_21}{Team winning percentage in 2021}
#'   \item{playoff_21}{1 if team made playoffs in 2021, 0 otherwise}
#'   \item{capacity}{Capacity of home stadium}
#'   \item{popul}{Population of team's metropolitan area (2020)}
#'   \item{payroll}{Total team payroll in 2022 (in millions of dollars)}
#' }
#' @source various
"baseball"

#' Mutual-fund performance data
#'
#' Data on mutual funds categorized as "Large Blend Equity" funds by Morningstar,
#' limited to funds in existence for more than 10 years. Data captured 2/28/2023.
#'
#' @format ## `mutualfunds`
#' A data frame with 208 rows and 11 columns:
#' \describe{
#'   \item{name}{Name of mutual fund}
#'   \item{fund_age}{Age of fund (in years)}
#'   \item{expense_ratio}{Expense ratio (net)}
#'   \item{aum}{Assets under management (in millions of dollars)}
#'   \item{min_investment}{Minimum investment level (in dollars)}
#'   \item{load}{Y if fund has a load (sales charge or fee), N if not}
#'   \item{manager_tenure}{Tenure of current fund manager (in years)}
#'   \item{return_1yr}{One-year annualized return}
#'   \item{return_3yr}{Three-year annualized return}
#'   \item{return_5yr}{Five-year annualized return}
#'   \item{return_10yr}{Ten-year annualized return}
#' }
#' @source <https://www.fidelity.com>
"mutualfunds"

#' Inflation data
#'
#' Data on inflation rates for 45 countries for a ten-year period (2010-2019).
#'
#' @format ## `inflation`
#' A data frame with 450 rows and 3 columns:
#' \describe{
#'   \item{country}{Country abbreviation}
#'   \item{year}{Year}
#'   \item{inflation}{Annual inflation rate (change in CPI)}
#' }
#' @source <https://data.oecd.org/price/inflation-cpi.htm>
"inflation"

#' Inflation expectations data
#'
#' Data on individual inflation expectations, based on the paper: "Measuring
#' consumer uncertainty about future inflation," by Wandi Bruine de Bruin,
#' Charles F. Manski, Giorgio Topa, Wilbert van der Klaauw, 2011,
#' Journal of Applied Econometrics, 26: 454-478. This dataset has only the
#' observations with point estimates of inflation for individuals between
#' 30 and 70 years of age. The survey took place in 2007 and 2008. The actual
#' inflation, for benchmark, was 3.2% in 2006, 2.9% in 2007, and 3.8% in 2008.
#'
#' @format ## `inflation_expectations`
#' A data frame with 290 rows and 6 columns:
#' \describe{
#'   \item{inflation_pred}{Individual prediction of inflation next year (integer; e.g. 10=10%)}
#'   \item{age}{Age (in years)}
#'   \item{finlit_score}{Financial literacy test score (out of 12 points)}
#'   \item{male}{1 if male, 0 otherwise}
#'   \item{collgrad}{1 if college graduate, 0 otherwise}
#'   \item{famincome_hi}{1 if family income > $75,000, 0 otherwise}
#' }
#' @source <https://journaldata.zbw.eu/dataset/measuring-consumer-uncertainty-about-future-inflation>
"inflation_expectations"

#' Dictator-game data
#'
#' Data on the results from "dictator games" played in an experimental study, based
#' on the paper "Giving and taking in dictator games -- differences by gender?
#' A replication study of Chowdhury et al.", Journal of Comments and Replications
#' in Economics, 2023. Each observation corresponds to one play of the game.
#' Earnings are for the dictator. Two game variants are the "giving game"
#' (dictator starts with endowment) and "taking game" (recipient starts with
#' endowment).
#'
#' @format ## `dictator`
#' A data frame with 137 rows and 5 columns:
#' \describe{
#'   \item{earnings}{Earnings of the dictator (between 0 and 10)}
#'   \item{giving}{1 if giving game, 0 otherwise}
#'   \item{taking}{1 if taking game, 0 otherwise}
#'   \item{female}{1 if dictator is female, 0 otherwise}
#'   \item{female_opp}{1 if recipient is female, 0 otherwise}
#' }
#' @source <https://journaldata.zbw.eu/dataset/giving-and-taking-in-dictator-games-replication>
"dictator"

#' Auction data
#'
#' Data on eBay auctions, based upon the paper "Econometrics of Auctions by Least
#' Squares" by Leonardo Rezende, Journal of Applied Econometrics, 2008, 23:925-948.
#' The dataset consists of eBay auctions for Apple iPod mini devices in June and
#' July 2006, limited to only auctions for the 4GB models.
#'
#' @format ## `auctions`
#' A data frame with 684 rows and 14 columns:
#' \describe{
#'   \item{ebay_auction_id}{eBay auction ID number}
#'   \item{bidders}{Number of bidders}
#'   \item{finalprice}{Final sales price}
#'   \item{seller_feedback_pct}{Seller's positive feedback percentage (e.g., 90 = 90%)}
#'   \item{seller_feedback_score}{Seller's feedback score (number of feedbacks received)}
#'   \item{reserveprice}{Reserve price set by seller (value of 0.01 if no reserve price)}
#'   \item{color_pink}{1 if iPod is pink, 0 otherwise}
#'   \item{color_blue}{1 if iPod is blue, 0 otherwise}
#'   \item{color_silver}{1 if iPod is silver, 0 otherwise}
#'   \item{color_green}{1 if iPod is green, 0 otherwise}
#'   \item{color_other}{1 if iPod is another color, 0 otherwise}
#'   \item{new}{1 if condition listed is new, 0 otherwise}
#'   \item{used}{1 if condition listed is used, 0 otherwise}
#'   \item{refurb}{1 if condition listed is refurbished, 0 otherwise}
#' }
#' @source <https://journaldata.zbw.eu/dataset/econometrics-of-auctions-by-least-squares>
"auctions"

#' Congressional election data
#'
#' Data on congressional election outcomes in the United States between 1948 and 1990,
#' based upon the paper "Do Voters Affect or Elect Policies? Evidence from the
#' U.S. House" by David S. Lee, Enrico Moretti, Matthew J. Butler, 2004,
#' Quarterly Journal of Economics, 119: 807-859. This sample is restricted to
#' elections where (i) the incumbent is running for re-election and (ii) are not
#' running unopposed. There are 9,788 observations available, and demographic
#' variables are available for 6,774 of the observations.
#'
#' @format ## `congress`
#' A data frame with 9,788 rows and 15 columns:
#' \describe{
#'   \item{state}{State code (ICPSR coding)}
#'   \item{district}{District code}
#'   \item{demvote}{Number of votes for Democrat candidate}
#'   \item{repvote}{Number of votes for Republican candidate}
#'   \item{year}{Year of election}
#'   \item{demvoteshare}{Percentage of vote for Democrat candidate}
#'   \item{lagdemvoteshare}{Percentage of vote for Democrat candidate in last election}
#'   \item{totpop}{Population of Congressional district}
#'   \item{medianincome}{Median (nominal) income of Congressional district}
#'   \item{pcturban}{Percentage of Congressional district that is urban}
#'   \item{pctblack}{Percentage of Congressional district that is black}
#'   \item{pcthighschl}{Percentage of Congressional district that is HS graduates}
#'   \item{votingpop}{Voting population of Congressional district}
#'   \item{democrat}{1 if Democrat wins election (demvoteshare>0.5), 0 otherwise}
#'   \item{lagdemocrat}{1 if Democrat won last election (lagdemvoteshare>0.5), 0 otherwise}
#' }
#' @source <https://eml.berkeley.edu/%7Emoretti/data3.html>
"congress"

#' Brand data
#'
#' Data on the purchase behavior of customers at a specific market. The dataset
#' consists of customers who purchased one of five candy-bar brands in their previous
#' visit to the market and records whether or not they make a purchase during
#' this visit and, if so, which brand they purchase. The dataset is adapted from
#' the full dataset that is referenced in the source citation.
#'
#' @format ## `brands`
#' A data frame with 14,560 rows and 3 columns:
#' \describe{
#'   \item{purchase}{1 if customer makes a purchase, 0 otherwise}
#'   \item{brand}{Brand purchased (1 through 5), 0 if no purchase}
#'   \item{last_brand}{Brand purchased (1 through 5) during last visit}
#' }
#' @source <https://medium.com/%40miradzji/purchase-probability-analysis-in-certain-market-segments-with-python-b346654ea5ec>
"brands"

#' Health-expenditure data
#'
#' Data on healthcare utilization and expenditures for adults 50 years and older in
#' the United States, taken from the Health and Retirement Study (HRS) and Asset and
#' Health Dynamics Among the Oldest Old (AHEAD). Data was originally used in the
#' paper "On the distribution and dynamics of health care costs" by Eric French and
#' John Bailey Jones, 2004, Journal of Applied Econometrics, 19: 705-721. This
#' dataset is restricted to non-married individuals in the year 2000.
#'
#' @format ## `hrs`
#' A data frame with 6,052 rows and 14 columns:
#' \describe{
#'   \item{age}{Age (in years)}
#'   \item{assets}{Total assets (in dollars); bottom-coded at $20,000}
#'   \item{doctor_visits}{Number of doctor visits}
#'   \item{drug_costs}{Drug costs (in dollars)}
#'   \item{income}{Income (in dollars); bottom-coded at $5,000}
#'   \item{hosp_nights}{Number of nights spent in hospital}
#'   \item{ins_private}{1 if insurance is private or employee-provided, 0 otherwise}
#'   \item{ins_medicare}{1 if insurance is Medicare, 0 otherwise}
#'   \item{ins_medicaid}{1 if insurance is Medicaid, 0 otherwise}
#'   \item{ins_none}{1 if no health insurance, 0 otherwise}
#'   \item{male}{1 if male, 0 otherwise}
#'   \item{medical_costs}{Total medical costs (in dollars)}
#'   \item{nodrug_financial}{1 if did not take prescription drugs for financial reasons, 0 otherwise}
#'   \item{outofpocket_costs}{Total out-of-pocket medical costs (in dollars)}
#' }
#' @source <https://journaldata.zbw.eu/dataset/on-the-distribution-and-dynamics-of-health-care-costs>
"hrs"

#' Econometrics course data
#'
#' Data on performance in a graduate econometrics course, with GRE test information
#' and domestic/international status available.
#'
#' @format ## `metricsgrades`
#' A data frame with 68 rows and 4 columns:
#' \describe{
#'   \item{gre_quant}{Score on GRE quantitative test (out of 170)}
#'   \item{gre_verbal}{Score on GRE verbal test (out of 170)}
#'   \item{domestic}{1 if domestic student, 0 if international student}
#'   \item{total}{Overall composite course grade (out of 100 points)}
#' }
"metricsgrades"

#' Resume response data
#'
#' Data on responses to hypothetical resumes that were created for an experimental
#' study, based upon "Ban the Box, Criminal Records, and Racial Discrimination:
#' A Field Experiment" by Amanda Agan and Sonja Starr, 2018, Quarterly Journal
#' of Economics, 133: 191-235. This dataset considers only the subsample from
#' before the ban-the-box initiative.
#'
#' @format ## `resume`
#' A data frame with 7,332 rows and 7 columns:
#' \describe{
#'   \item{crime}{1 if applicant has criminal record, 0 otherwise}
#'   \item{drugcrime}{1 if applicant has committed drug crime, 0 otherwise}
#'   \item{propertycrime}{1 if applicant has committed property crime, 0 otherwise}
#'   \item{ged}{1 if applicant has GED, 0 otherwise}
#'   \item{empgap}{1 if applicant has a gap in employment, 0 otherwise}
#'   \item{black}{1 if applicant is black, 0 otherwise}
#'   \item{response}{1 if applicant received positive response, 0 otherwise}
#' }
#' @source \doi{10.7910/DVN/VPHMNT}
"resume"

#' Housing price data
#'
#' Data on house sales in Ames, Iowa between 2006 and 2010. The dataset is limited
#' to one-family homes with public utilities and excludes new home sales.
#'
#' @format ## `houseprices`
#' A data frame with 973 rows and 16 columns:
#' \describe{
#'   \item{lotarea}{Area of lot (in square feet)}
#'   \item{overallqual}{Overall home quality (scale 1-10, 10 best)}
#'   \item{yearbuilt}{Year house was built}
#'   \item{yearremodadd}{Year house was remodeled (equal to yearbuilt if never)}
#'   \item{bsmtfinsf}{Area of finished basement (in square feet, 0 if no finished basement)}
#'   \item{grlivarea}{Total non-basement living area (in square feet)}
#'   \item{fullbath}{Number of full bathrooms}
#'   \item{halfbath}{Number of half bathrooms}
#'   \item{bedroomabvgr}{Number of non-basement bedrooms}
#'   \item{totrmsabvgrd}{Number of non-basement rooms (not including bathrooms)}
#'   \item{fireplaces}{Number of fireplaces}
#'   \item{garagecars}{Size of garage (0 if no garage)}
#'   \item{mosold}{Month house sold (1=Jan,...,12=Dec)}
#'   \item{yrsold}{Year house sold}
#'   \item{saleprice}{Sales price of house (in dollars)}
#'   \item{centralair}{1 if house has central air, 0 otherwise}
#' }
#' @source <https://www.kaggle.com/competitions/house-prices-advanced-regression-techniques/data>
"houseprices"

#' Married-couple data
#'
#' Data on married couples in the United States from the 2003 Community Tracking
#' Study (CTS) Household Survey.
#'
#' @format ## `married`
#' A data frame with 4,126 rows and 11 columns:
#' \describe{
#'   \item{age_w}{Age of wife (in years)}
#'   \item{age_h}{Age of husband (in years)}
#'   \item{educ_w}{Education of wife (in years)}
#'   \item{educ_h}{Education of husband (in years)}
#'   \item{bmi_w}{Body mass index of wife (bottom-coded at 18, top-coded at 40)}
#'   \item{bmi_h}{Body mass index of husband (bottom-coded at 18, top-coded at 40)}
#'   \item{smoke_w}{1 if wife smokes, 0 otherwise}
#'   \item{smoke_h}{1 if husband smokes, 0 otherwise}
#'   \item{employed_w}{1 if wife employed, 0 otherwise}
#'   \item{employed_h}{1 if husband employed, 0 otherwise}
#'   \item{famincome}{Annual family income (in dollars, top-coded at $150,000)}
#' }
#' @source <https://www.icpsr.umich.edu/web/HMCA/studies/4216>
"married"

#' Strike duration data
#'
#' Data on the length of worker contract strikes within U.S. manufacturing for
#' the period 1968-1976, based upon "The Duration of Contract strikes in
#' U.S. Manufacturing" by John Kennan, 1985, Journal of Econometrics, 28: 5-28.
#'
#' @format ## `strikes`
#' A data frame with 566 rows and 1 column:
#' \describe{
#'   \item{duration}{Strike duration (in weeks)}
#' }
#' @source <https://cameron.econ.ucdavis.edu/mmabook/mmadata.html>
"strikes"

#' Website visitor arrival data
#'
#' Data on the arrival time of website visitors during a specific hour for
#' a hypothetical website.
#'
#' @format ## `website`
#' A data frame with 748 rows and 2 columns:
#' \describe{
#'   \item{arrival}{Arrival time during the hour (in minutes)}
#'   \item{time_since_last}{Time since last visitor (in minutes)}
#' }
"website"

#' Premier League soccer data
#'
#' Data on all game results for the 2020 Premier League soccer season. The
#' Premier League consists of 20 teams. Each team plays every other team twice
#' (home and away) during the season, so there are a total of 38 rounds in
#' the season and 380 total games.
#'
#' @format ## `premier2020`
#' A data frame with 380 rows and 5 columns:
#' \describe{
#'   \item{round}{Round (values 1 to 38)}
#'   \item{hometeam}{Home team}
#'   \item{awayteam}{Away team}
#'   \item{homegoals}{Number of goals by the home team}
#'   \item{awaygoals}{Number of goals by the away team}
#' }
#' @source <https://en.wikipedia.org/wiki/2020%E2%80%9321_Premier_League>
"premier2020"

#' Popular names data
#'
#' Data on the names of all babies born in the United States in 2022, as
#' provided by the Social Security Administration. Each observation corresponds
#' to a specific name and gender, with a count of that name provided. For
#' confidentiality reasons, the minimum count for any name is 5. All other
#' names (with fewer than 5 occurrences in the U.S.) are included within the
#' observation having "OTHER" as the name. There are two "OTHER" observations,
#' one for female babies and one for male babies.
#'
#' @format ## `names2022`
#' A data frame with 31917 rows and 3 columns:
#' \describe{
#'   \item{name}{Baby's name}
#'   \item{gender}{F if female, M if male}
#'   \item{count}{Number of babies with name and gender}
#' }
#' @source <https://www.ssa.gov/oact/babynames/limits.html>
"names2022"
