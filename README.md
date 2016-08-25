# Indy Transit survey

This is a Indianapolis Iron Yard Final Project for the June 2016 cohort.
I pitched this project in an effort to create an app for something I am very passionate about: the expansion of public transportation in the Indianapolis area. As a traveler to places that have well-established and reliable public transportation, specifically commuter rail lines, I believe that the Indianapolis area would see increased many increased [benefits] by expanding it's public transportation system. Through the collection of data, my app provides lawmakers and services like IndyConnect (name other sources) with raw data to help determine where the need to either include more bus lines or perhaps build a light commuter rail system is. In previous surveys, people were contacted by phone and asked a series of questions. My app could be distributed to the public via kiosks and websites and would collect data that would be immediately available.

Visual representation through the use of heatmapping technology provided by Google Maps.

Computation of commuter cost information provides:
  * commuters to become aware of the cost savings through the use of public transportation
  * communities to see the benefits these cost savings have that would allow commuters from their area to put money back into the community rather than toward the cost of commuters_within_range
  * lawmakers and public transportation authorities raw data for use in referendum meetings

## Calculations
Commute calculations are based on Google Maps shortest route calculations and a 5 day workweek with 2 commutes per day.

Cost calculations are based data from the https://www.irs.gov/uac/newsroom/2016-standard-mileage-rates-for-business-medical-and-moving-announcedIRS IRS 2016 Standard Mileage Rate for Business

Transit calculations are based on data from the https://www.transit.dot.gov/ntd The National Transit Database of the Federal Transit Administration using the national average fare of

Ruby Gems specifically used for this project
* FriendlyID
* geokit
* geokit-rails
* polylines
* google_directions, with an [add-on??] provided by my instructor, Dummied

for site Administration
* remotipart
* rails_admin
