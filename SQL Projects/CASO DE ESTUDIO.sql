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


-----------------------------------------------------------------------------------------------------

-- 4. Preferencias de comunicación y su relación con el uso de Internet:
--¿Los estudiantes que prefieren comunicarse a través de llamadas telefónicas (phone_bi) tienden a usar menos Internet (internet_bi)?
--¿Existe alguna correlación entre estos comportamientos? 
SELECT 
    phone_bi,
    AVG(CASE WHEN internet_bi = 'Yes' THEN 1 ELSE 0 END) AS usan_internet_diario
FROM students
WHERE students IS NOT NULL
GROUP BY phone_bi; -- promedio de uso de internet para estudiantes que NO usan telefono para comunicarse 12%
                   -- promedio de uso de internet para estudiantes que SI usan telefono para comunicarse 66%

-----------------------------------------------------------------------------------------------------

-- 5. Influencia del entorno familiar en la adaptación cultural:
--¿Cómo influye el nivel de interacción con padres y familiares (parents_bi, relative_bi) en la adaptación cultural de los estudiantes
--(medido por el conocimiento del idioma japonés y la categoría de interacción social)?

SELECT 
    parents_bi,        --Agrupamos por los niveles de interacción con padres.
    relative_bi,       --Agrupamos por los niveles de interacción con  familiares.
    AVG(japanese) AS dominio_idioma_japones,        -- promedio del conocimiento del idioma japonés para cada grupo
    AVG(CASE WHEN friends_bi = 'Yes' THEN 1 ELSE 0 END) AS interactua_amigos,     --proporción de estudiantes que tienen amigos en cada grupo de interacción.
    AVG(CASE WHEN others_bi = 'Yes' THEN 1 ELSE 0 END) AS interactua_con_otros    -- proporción de estudiantes que tienen relacion con otras personas en cada grupo de interacciónda. Dá otra perspectiva de la adaptación social.
FROM students
WHERE students IS NOT NULL
GROUP BY parents_bi, relative_bi;

--La estrategia es agrupar los datos según los niveles de interacción con padres y familiares y calcular el promedio de conocimiento del idioma japonés y alguna medida de la interacción social.
"Yes" (Parents) y "Yes" (Relatives): 3.25
"Yes" (Parents) y "No" (Relatives): 3.52
"No" (Parents) y "Yes" (Relatives): 2.66
"No" (Parents) y "No" (Relatives): 3.04

--Los estudiantes que tienen interacción con sus padres, independientemente de si tienen interacción con otros familiares,
--tienden a tener un mayor conocimiento del idioma japonés (3.25 y 3.52).

--Los estudiantes que no tienen interacción con sus padres pero sí con otros familiares muestran un conocimiento menor del idioma japonés (2.66),
--lo que sugiere que la interacción directa con los padres puede tener un mayor impacto en el aprendizaje del idioma.

--Aquellos que no tienen interacción con padres ni con otros familiares aún tienen un nivel relativamente alto (3.04), lo que podría indicar que otros factores,
--como la integración social o la motivación personal, también influyen.

-----------------------------------------------------------------------------------

--6. Comportamiento de los estudiantes según la categoría de estancia (stay_cate):
--¿Qué diferencias existen en el comportamiento y las preferencias de los estudiantes según su categoría de estancia (corta o larga)?
--¿Se observan patrones distintos en su interacción social?

SELECT 
    stay_cate,
    AVG(CASE WHEN friends_bi = 'Yes' THEN 1 ELSE 0 END) AS interactua_amigos,
    AVG(CASE WHEN alone_bi = 'Yes' THEN 1 ELSE 0 END) AS prefierensolos
FROM students
WHERE students IS NOT NULL
GROUP BY stay_cate;

--estadía larga: El 50% interactúa con amigos.
--estadía corta: El 42.86% interactúa con amigos.
--estadía media: El 51.72% interactúa con amigos.
--Esto sugiere que una estancia más prolongada podría estar relacionada con una mayor integración social.

--estadía larga (0.21): El 21.43% de los estudiantes de estancia larga prefiere estar solo.
--estadía corta (0.33): El 32.65% de los estudiantes de estancia corta prefiere estar solo.
--estadía media (0.19): El 18.97% de los estudiantes de estancia media prefiere estar solo.

--Los estudiantes de estancia corta muestran la mayor preferencia por estar solos, lo que podría estar relacionado con una menor adaptación al entorno.
--Los estudiantes de estancia larga y media tienen una menor tendencia a preferir la soledad, lo que sugiere una mayor integración social.

------------------------------------------------------------------------------------------
