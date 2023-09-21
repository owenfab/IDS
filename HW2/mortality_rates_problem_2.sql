CREATE TABLE MortalityRates(
   Year                    INTEGER,
   Underﬁve_mortality_rate NUMERIC(5,1),
   Infant_mortality_rate   NUMERIC(5,1),
   Neonatal_mortality_rate NUMERIC(5,1)
);
INSERT INTO MortalityRates(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (1990,93.4,64.8,36.8);
INSERT INTO MortalityRates(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (1991,92.1,63.9,36.3);
INSERT INTO MortalityRates(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (1992,90.9,63.1,35.9);
INSERT INTO MortalityRates(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (1993,89.7,62.3,35.4);
INSERT INTO MortalityRates(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (1994,88.7,61.4,null);
INSERT INTO MortalityRates(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (1995,87.3,60.5,34.4);
INSERT INTO MortalityRates(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (1996,85.6,59.4,33.7);
INSERT INTO MortalityRates(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (1997,null,58.2,33.1);
INSERT INTO MortalityRates(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (1998,82.1,56.9,32.3);
INSERT INTO MortalityRates(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (1999,79.9,55.4,31.5);
INSERT INTO MortalityRates(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (2000,77.5,53.9,30.7);
INSERT INTO MortalityRates(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (2001,74.8,52.1,29.8);
INSERT INTO MortalityRates(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (2002,72,null,28.9);
INSERT INTO MortalityRates(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (2003,69.2,48.6,28);
INSERT INTO MortalityRates(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (2004,66.7,46.9,null);
INSERT INTO MortalityRates(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (2005,null,45.1,26.1);
INSERT INTO MortalityRates(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (2006,61.1,43.4,25.3);
INSERT INTO MortalityRates(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (2007,58.5,null,24.4);
INSERT INTO MortalityRates(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (2008,56.2,40.3,23.6);
INSERT INTO MortalityRates(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (2009,53.7,38.8,22.9);
INSERT INTO MortalityRates(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (2010,null,37.4,22.2);
INSERT INTO MortalityRates(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (2011,49.3,36,21.5);
INSERT INTO MortalityRates(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (2012,47.3,34.7,20.8);
INSERT INTO MortalityRates(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (2013,45.5,33.6,20.2);
INSERT INTO MortalityRates(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (2014,43.7,null,19.6);
INSERT INTO MortalityRates(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (2015,42.2,31.4,19.1);
INSERT INTO MortalityRates(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (2016,40.8,30.5,18.6);

update MortalityRates
set Underﬁve_mortality_rate = (select median(Underﬁve_mortality_rate) from MortalityRates)
where Underﬁve_mortality_rate is null;

update MortalityRates
set Infant_mortality_rate = (select median(Infant_mortality_rate) from MortalityRates)
where Infant_mortality_rate is null;

update MortalityRates
set Neonatal_mortality_rate = (select median(Neonatal_mortality_rate) from MortalityRates)
where Neonatal_mortality_rate is null;

select *
from MortalityRates;

select Year, min(Infant_mortality_rate) as "Minimum Infant Mortality Rate"
from MortalityRates;

select Year, max(Infant_mortality_rate) as "Maximum Infant Mortality Rate"
from MortalityRates;

select Year
from MortalityRates
where Neonatal_mortality_rate > (select avg(Neonatal_mortality_rate) from MortalityRates);

select Infant_mortality_rate
from MortalityRates
order by Infant_mortality_rate desc;

select min(Underﬁve_mortality_rate), max(Underﬁve_mortality_rate), avg(Underﬁve_mortality_rate), variance(Underﬁve_mortality_rate), stdev(Underﬁve_mortality_rate)
from MortalityRates;

select min(Infant_mortality_rate), max(Infant_mortality_rate), avg(Infant_mortality_rate), variance(Infant_mortality_rate), stdev(Infant_mortality_rate)
from MortalityRates;

select min(Neonatal_mortality_rate), max(Neonatal_mortality_rate), avg(Neonatal_mortality_rate), variance(Neonatal_mortality_rate), stdev(Neonatal_mortality_rate)
from MortalityRates;

alter table MortalityRates
add Above_Five_Mortality_Rate numeric(5,1);

update MortalityRates
set Above_Five_Mortality_Rate = (select median(Underﬁve_mortality_rate) from MortalityRates);

select *
from MortalityRates;