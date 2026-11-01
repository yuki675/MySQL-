select
 d.diagnosis_name as 診断名,
 count(e.encounter_id) as 症例数,
 round(avg(datediff(e.discharge_date,e.admission_date)),1) as 平均入院日数,
 round(avg(dr.total_claim_cost),0) as 平均医療費
from encounters e
 join diagnoses d on e.encounter_id = d.encounter_id
 join dpc_records dr on d.encounter_id = dr.encounter_id
group by 診断名
order by 症例数 desc;