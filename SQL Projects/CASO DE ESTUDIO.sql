--CREANDO BASE DE DATOS.  

CREATE TABLE students (
    inter_dom VARCHAR(50),
    region VARCHAR(50),
    gender VARCHAR(50),
    academic VARCHAR(50),
    age FLOAT,
    age_cate FLOAT,
    stay FLOAT,
    stay_cate VARCHAR(50),
    japanese FLOAT,
    japanese_cate VARCHAR(50),
    english FLOAT,
    english_cate VARCHAR(50),
    intimate VARCHAR(50),
    religion VARCHAR(50),
    suicide VARCHAR(50),
    dep VARCHAR(50),
    deptype VARCHAR(50),
    todep VARCHAR(50),
    depsev VARCHAR(50),
    tosc VARCHAR(50),
    apd VARCHAR(50),
    ahome VARCHAR(50),
    aph VARCHAR(50),
    afear VARCHAR(50),
    acs VARCHAR(50),
    aguilt VARCHAR(50),
    amiscell VARCHAR(50),
    toas VARCHAR(50),
    partner VARCHAR(50),
    friends VARCHAR(50),
    parents VARCHAR(50),
    relative VARCHAR(50),
    profess VARCHAR(50),
    phone VARCHAR(50),
    doctor VARCHAR(50),
    reli VARCHAR(50),
    alone VARCHAR(50),
    others VARCHAR(50),
    internet VARCHAR(50),
    partner_bi VARCHAR(50),
    friends_bi VARCHAR(50),
    parents_bi VARCHAR(50),
    relative_bi VARCHAR(50),
    professional_bi VARCHAR(50),
    phone_bi VARCHAR(50),
    doctor_bi VARCHAR(50),
    religion_bi VARCHAR(50),
    alone_bi VARCHAR(50),
    others_bi VARCHAR(50),
    internet_bi VARCHAR(50)
);


--1- Distribución demográfica por género y región:
--¿Cómo se distribuye la población de estudiantes por género y región de origen?
--¿Hay alguna región con un predominio de un género específico?

SELECT count(*),
       region,
       gender
FROM public.students
WHERE region IS NOT NULL AND gender IS NOT NULL
GROUP BY region, gender;
