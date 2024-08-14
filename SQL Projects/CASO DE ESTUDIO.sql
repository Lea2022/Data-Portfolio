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

SELECT COUNT(*),
		region,
		gender
FROM students  WHERE region IS NOT NULL
GROUP BY region,gender
ORDER BY  COUNT(*)DESC,REGION,gender ;
--Puede verse que predominan las estudiantes femeninas de la región SEA. dando un total de 90 estudiantes. 


---------------------------------------------------------------------------------------------------


-- 2. Relación entre nivel académico y conocimiento del idioma japonés:
--¿Existe una relación significativa entre el nivel académico de los estudiantes y su dominio del idioma japonés?
--¿Los estudiantes de posgrado tienden a tener un mayor conocimiento del idioma que los estudiantes de pregrado?

SELECT academic, COUNT(*) AS academic_count
FROM students WHERE academic IS NOT NULL
GROUP BY academic;

-- podemos ver que hay 247 alunmos con pregrado y 21 con postgrado.
-- Luego, se analíza cómo se distribuyen los niveles de conocimiento del idioma japonés ('japanese') en toda la población de estudiantes:

SELECT academic, AVG(japanese) AS avg_japanese
FROM students WHERE academic IS NOT NULL
GROUP BY academic;
-- el promedio de años de estudio del idioma japones de estudiantes con un pregrado es 3.174089068825911
-- mientras que para los estudiantes con un postgrado el promedio es 2.1904761904761907
-- se podría concluir que el nivel académico no es un factor determinante en el conocimiento del idioma japonés entre los estudiantes.

----------------------------------------------------------------------------------------------------

-- 3. Comportamiento de los estudiantes:
--¿Cuántos estudiantes prefieren estar solos (alone_bi) frente a los que prefieren estar con otros (others_bi)?

-- Conteo de estudiantes que prefieren estar solos
SELECT alone_bi, COUNT(*) AS prefierensolos
FROM students
WHERE students IS NOT NULL
GROUP BY alone_bi;   --"No"	182 /"Yes" 60

-- Conteo de estudiantes que prefieren estar con otros
SELECT others_bi, COUNT(*) AS prefierenconotros
FROM students
WHERE students IS NOT NULL
GROUP BY others_bi;  --"No" 225/ "Yes" 17

-- 4. Preferencias de comunicación y su relación con el uso de Internet:
--¿Los estudiantes que prefieren comunicarse a través de llamadas telefónicas (phone_bi) tienden a usar menos Internet (internet_bi)?
--¿Existe alguna correlación entre estos comportamientos? 
SELECT 
    phone_bi,
    AVG(CASE WHEN internet_bi = 'Yes' THEN 1 ELSE 0 END) AS proportion_using_internet
FROM students
WHERE students IS NOT NULL
GROUP BY phone_bi; -- promedio de uso de internet para estudiantes que NO usan telefono para comunicarse 12%
                   -- promedio de uso de internet para estudiantes que SI usan telefono para comunicarse 66%

--------------------------------------------------------------------------------------------------------






