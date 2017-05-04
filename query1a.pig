bag1 = load '/user/hive/warehouse/h1b_final' using PigStorage('\t') as (s_no:int,case_status:chararray,employer_name:chararray,soc_name:chararray,job_title:chararray,full_time_position:chararray,prevailing_wage:int,year:chararray,worksite:chararray,longitude:double,latitude:double);
describe bag1;
bag2 = filter bag1 by ($4 MATCHES '.*DATA ENGINEER.*');
bag3 = group bag2 by year;
bag4 = foreach bag3 generate group,COUNT(bag2);
dump bag4;
