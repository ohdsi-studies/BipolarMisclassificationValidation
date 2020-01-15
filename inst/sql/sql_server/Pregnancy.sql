CREATE TABLE #Codesets (
  codeset_id int NOT NULL,
  concept_id bigint NOT NULL
)
;

INSERT INTO #Codesets (codeset_id, concept_id)
SELECT 0 as codeset_id, c.concept_id FROM (select distinct I.concept_id FROM
(
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (444094,433260,4088927,2721147,2784560,2784555,2784556,2784557,2784558,2784561,2784562,45890386,45888247,2004824,2004808,42739743,2101814,2101807,2101811,2101812,2101808,2101806,2101593,45888575,45890042,2110312,2110313,2004744,2004526,2004525,42739562,2514559,2004722,45888722,2110305,2110304,2721524,2110316,45888911,45888912,2110323,2110324,2110317,45888511,4192036,2004789,2004790,2784325,2784326,2004785,2004823,2110301,45887754,2514560,2110311,2784578,45889690,2784511,2004805,2004490,2004489,2784529,2784535,2784541,2784547,2784553,2784331,2784533,2784539,2784545,2784551,2784328,2784530,2784536,2784542,2784548,2784329,2784531,2784537,2784543,2784330,2784532,2784538,2784544,2784550,2784332,2784534,2784540,2784546,44786550,44786551,2004766,2110303,2004848,2004849,45888408,2110310,2004769,2784575,2784576,2784566,2784564,2784571,2784567,2784568,2784572,2784573,2784574,2784570,2004787,2004751,2004810,2004809,45887606,2004825,2004727,2004711,2004702,2004708,2004709,2106904,2110306,2004791,2004851,2110084,2004771,2721146,2721148,2721149,2721150,45889686,2110331,2110332,2110333,45890234,2110334,2110335,2110336,2110329,2110330,2004745,2101829,2784580,2784582,2784581,2784583,2784791,2784786,2784787,2784788,2784789,2784790,2784590,2784585,2784586,2784587,2784785,2784591,2784592,2784593,2784783,2784784,2784588,2784589,2721236,2004748,2004750,2004749,2004804,2004806,45888964,45888503,2110299,2110300,2110236,2004786,2004703,2004704,2004845,2004763,2004826,2004764,2004762,2004705,2004706,2110337,2101016,2101598,2101813,2721745,2784554,2828096,2866967,2866968,2800155,2820201,2833336,2800156,2820202,2840986,2845529,2880040,2784324,2880037,2805524,2828094,2893069,2784577,2898814,2813039,2893071,2784327,2845528,2872133,2813038,2840985,2880038,2893070,2833335,2800154,2880039,2828095,2805525,2784563,2858777,2867095,2858779,2820204,2805526,2800157,2872134,2853235,2845530,2880041,2828097,2898813,2853236,2820203,2858778,2784579,2872135,2840987,2853237,2845531,2828098,2872136,2885242,2784584,2813040,2805528,2853238,2885245,2898816,2840990,2880042,2833338,2805529,2885244,2840991,2840992,2833339,2858781,2867099,2893072,2805527,2813041,2828099,2898815,2867096,2828100,2885243,2872141,2820206,2872137,2800158,2840989,2872138,2872139,2820205,2893073,2845532,2858780,2872140,2867097,2833337,2840988,2867098,2828093,2784792,2828101,2898942,2820207,2845533,2820208,2867100,2833340,2784797,2893074,2898943,2872267,2867101,2853239,2800159,2805530,2867102,2820209,2880043,2828102,2858783,2805531,2858784,2858782,2898944,2785336,2800160,2820210,2880044,2880045,2880046,2853241,2845534,2853240,2805533,2828105,2813042,2828104,2833341,2828103,2805532,2867103,2785344,2872268,2828106,2880047,2872269,2845535,2872270,2853242,2805534,2893075,2880048,2805535,2785350,2820211,2828107,2845536,2885246,2800161,2845537,2800162,2004846,2004767,2004746,2004802,2004822,2004811,2004710,2004807,2004765,2004707,2004803,2004847,2004862,2004768,2004783,2004724,45888462,4191809,2004731,2004747,2004726,2004730,2004723,2110314,2101832,2617494,2618150,2618151,2618152,2618153,2618154,2618155,2101830,2007585,2004782,2004788,2784793,2784795,2784794,2784796,2784815,2784799,2784802,2784807,2784801,2784811,2784805,2784806,2784816,2784800,2784804,2784809,2784814,2784798,2004842,2004829,2004830,2004843,2004827,2004828,2004844,2004831,2784813,45890247,2784810,2004770,2785339,2785340,2785341,2785342,2785338,2785337,2785345,2785346,2785347,2785348,2785349,2110315,2110322,2110307,2110319,2004346,2101831,2110318,2721391,2004850,45889004,45889225,2110295,2110298,2110296,2110297,2110293,2110294,2004725,2785352,2110325,45888020,2110326,2110327,2110328,45887772,2211750,2211749,45888652,2211748,2211747,45888041,2211752,2211751,45888752,2211754,2211753,2211756,2211755,2211757,2110340,2110341,2110342,2004742,2004728,2004729,45887710,45888676,2110320,2110321,2110308,45887987,2110309,2721525)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (444094,433260,4088927)
  and c.invalid_reason is null

) I
) C;


with primary_events (event_id, person_id, start_date, end_date, op_start_date, op_end_date, visit_occurrence_id) as
(
-- Begin Primary Events
select P.ordinal as event_id, P.person_id, P.start_date, P.end_date, op_start_date, op_end_date, cast(P.visit_occurrence_id as bigint) as visit_occurrence_id
FROM
(
  select E.person_id, E.start_date, E.end_date,
         row_number() OVER (PARTITION BY E.person_id ORDER BY E.sort_date ASC) ordinal,
         OP.observation_period_start_date as op_start_date, OP.observation_period_end_date as op_end_date, cast(E.visit_occurrence_id as bigint) as visit_occurrence_id
  FROM
  (
  -- Begin Condition Occurrence Criteria
SELECT C.person_id, C.condition_occurrence_id as event_id, C.condition_start_date as start_date, COALESCE(C.condition_end_date, DATEADD(day,1,C.condition_start_date)) as end_date,
       C.CONDITION_CONCEPT_ID as TARGET_CONCEPT_ID, C.visit_occurrence_id,
       C.condition_start_date as sort_date
FROM
(
  SELECT co.*
  FROM @cdm_database_schema.CONDITION_OCCURRENCE co
  JOIN #Codesets codesets on ((co.condition_concept_id = codesets.concept_id and codesets.codeset_id = 0))
) C


-- End Condition Occurrence Criteria

UNION ALL
-- Begin Procedure Occurrence Criteria
select C.person_id, C.procedure_occurrence_id as event_id, C.procedure_date as start_date, DATEADD(d,1,C.procedure_date) as END_DATE,
       C.procedure_concept_id as TARGET_CONCEPT_ID, C.visit_occurrence_id,
       C.procedure_date as sort_date
from
(
  select po.*
  FROM @cdm_database_schema.PROCEDURE_OCCURRENCE po
JOIN #Codesets codesets on ((po.procedure_concept_id = codesets.concept_id and codesets.codeset_id = 0))
) C


-- End Procedure Occurrence Criteria

  ) E
	JOIN @cdm_database_schema.observation_period OP on E.person_id = OP.person_id and E.start_date >=  OP.observation_period_start_date and E.start_date <= op.observation_period_end_date
  WHERE DATEADD(day,0,OP.OBSERVATION_PERIOD_START_DATE) <= E.START_DATE AND DATEADD(day,0,E.START_DATE) <= OP.OBSERVATION_PERIOD_END_DATE
) P
WHERE P.ordinal = 1
-- End Primary Events

)
SELECT event_id, person_id, start_date, end_date, op_start_date, op_end_date, visit_occurrence_id
INTO #qualified_events
FROM
(
  select pe.event_id, pe.person_id, pe.start_date, pe.end_date, pe.op_start_date, pe.op_end_date, row_number() over (partition by pe.person_id order by pe.start_date ASC) as ordinal, cast(pe.visit_occurrence_id as bigint) as visit_occurrence_id
  FROM primary_events pe

) QE

;

--- Inclusion Rule Inserts

create table #inclusion_events (inclusion_rule_id bigint,
	person_id bigint,
	event_id bigint
);

with cteIncludedEvents(event_id, person_id, start_date, end_date, op_start_date, op_end_date, ordinal) as
(
  SELECT event_id, person_id, start_date, end_date, op_start_date, op_end_date, row_number() over (partition by person_id order by start_date ASC) as ordinal
  from
  (
    select Q.event_id, Q.person_id, Q.start_date, Q.end_date, Q.op_start_date, Q.op_end_date, SUM(coalesce(POWER(cast(2 as bigint), I.inclusion_rule_id), 0)) as inclusion_rule_mask
    from #qualified_events Q
    LEFT JOIN #inclusion_events I on I.person_id = Q.person_id and I.event_id = Q.event_id
    GROUP BY Q.event_id, Q.person_id, Q.start_date, Q.end_date, Q.op_start_date, Q.op_end_date
  ) MG -- matching groups

)
select event_id, person_id, start_date, end_date, op_start_date, op_end_date
into #included_events
FROM cteIncludedEvents Results
WHERE Results.ordinal = 1
;

-- date offset strategy

select event_id, person_id,
  case when DATEADD(day,0,start_date) > start_date then DATEADD(day,0,start_date) else start_date end as end_date
INTO #strategy_ends
from #included_events;


-- generate cohort periods into #final_cohort
with cohort_ends (event_id, person_id, end_date) as
(
	-- cohort exit dates
  -- End Date Strategy
SELECT event_id, person_id, end_date from #strategy_ends

),
first_ends (person_id, start_date, end_date) as
(
	select F.person_id, F.start_date, F.end_date
	FROM (
	  select I.event_id, I.person_id, I.start_date, E.end_date, row_number() over (partition by I.person_id, I.event_id order by E.end_date) as ordinal
	  from #included_events I
	  join cohort_ends E on I.event_id = E.event_id and I.person_id = E.person_id and E.end_date >= I.start_date
	) F
	WHERE F.ordinal = 1
)
select person_id, start_date, end_date
INTO #cohort_rows
from first_ends;

with cteEndDates (person_id, end_date) AS -- the magic
(
	SELECT
		person_id
		, DATEADD(day,-1 * 0, event_date)  as end_date
	FROM
	(
		SELECT
			person_id
			, event_date
			, event_type
			, MAX(start_ordinal) OVER (PARTITION BY person_id ORDER BY event_date, event_type ROWS UNBOUNDED PRECEDING) AS start_ordinal
			, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY event_date, event_type) AS overall_ord
		FROM
		(
			SELECT
				person_id
				, start_date AS event_date
				, -1 AS event_type
				, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY start_date) AS start_ordinal
			FROM #cohort_rows

			UNION ALL


			SELECT
				person_id
				, DATEADD(day,0,end_date) as end_date
				, 1 AS event_type
				, NULL
			FROM #cohort_rows
		) RAWDATA
	) e
	WHERE (2 * e.start_ordinal) - e.overall_ord = 0
),
cteEnds (person_id, start_date, end_date) AS
(
	SELECT
		 c.person_id
		, c.start_date
		, MIN(e.end_date) AS end_date
	FROM #cohort_rows c
	JOIN cteEndDates e ON c.person_id = e.person_id AND e.end_date >= c.start_date
	GROUP BY c.person_id, c.start_date
)
select person_id, min(start_date) as start_date, end_date
into #final_cohort
from cteEnds
group by person_id, end_date
;

DELETE FROM @target_database_schema.@target_cohort_table where cohort_definition_id = @target_cohort_id;
INSERT INTO @target_database_schema.@target_cohort_table (cohort_definition_id, subject_id, cohort_start_date, cohort_end_date)
select @target_cohort_id as cohort_definition_id, person_id, start_date, end_date
FROM #final_cohort CO
;



TRUNCATE TABLE #strategy_ends;
DROP TABLE #strategy_ends;


TRUNCATE TABLE #cohort_rows;
DROP TABLE #cohort_rows;

TRUNCATE TABLE #final_cohort;
DROP TABLE #final_cohort;

TRUNCATE TABLE #inclusion_events;
DROP TABLE #inclusion_events;

TRUNCATE TABLE #qualified_events;
DROP TABLE #qualified_events;

TRUNCATE TABLE #included_events;
DROP TABLE #included_events;

TRUNCATE TABLE #Codesets;
DROP TABLE #Codesets;
