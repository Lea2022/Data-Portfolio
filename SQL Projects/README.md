/* -----------------------------
En una universidad internacional en Japón, se llevó a cabo un estudio exhaustivo sobre la salud mental de los estudiantes, tanto nacionales como internacionales. Durante esta investigación, se realizaron encuestas que abordaron diversos factores considerados relevantes en el tema. En nuestro caso de estudio, nos centraremos en algunas de estas variables para responder a una serie de consignas y explorar posibles relaciones entre ellas utilizando habilidades en SQL.

La salud mental de los estudiantes es un tema crucial en el entorno académico, y Japón, con su rica cultura y avanzada tecnología, proporciona un contexto interesante para analizar estos aspectos. A medida que profundicemos en los datos, buscaremos patrones, correlaciones y posibles áreas de intervención para mejorar el bienestar de los estudiantes.
   -----------------------------*/
   
/* -----------------------------
   Consignas del caso de Estudio
   -----------------------------*/
   
-- 1. Distribución demográfica por género y región:

¿Cómo se distribuye la población de estudiantes por género y región de origen? ¿Hay alguna región con un predominio de un género específico?

-- 2. Relación entre nivel académico y conocimiento del idioma japonés:

   ¿Existe una relación significativa entre el nivel académico de los estudiantes y su dominio del idioma japonés?
   ¿Los estudiantes de posgrado tienden a tener un mayor conocimiento del idioma que los estudiantes de pregrado?
   
-- 3.Impacto de la duración de la estancia en Japón en la integración social:

¿Cómo afecta la duración de la estancia en Japón a la integración social de los estudiantes, medida por la cantidad de amigos y conexiones sociales?

-- 4. Preferencias de comunicación y su relación con el uso de Internet:

¿Los estudiantes que prefieren comunicarse a través de llamadas telefónicas (phone_bi) tienden a usar menos Internet (internet_bi)? ¿Existe alguna correlación entre estos comportamientos?

-- 5. Influencia del entorno familiar en la adaptación cultural:

¿Cómo influye el nivel de interacción con padres y familiares (parents_bi, relative_bi) en la adaptación cultural de los estudiantes (medido por el conocimiento del idioma japonés y la categoría de interacción social)?

-- 6. Comportamiento de los estudiantes según la categoría de estancia (stay_cate):

¿Qué diferencias existen en el comportamiento y las preferencias de los estudiantes según su categoría de estancia (corta o larga)? ¿Se observan patrones distintos en su interacción social y uso de recursos?

-- 7. Relación entre la edad y la adaptación a la vida en Japón:

¿Cómo varía la adaptación a la vida en Japón (conocimiento del idioma, integración social) según la edad de los estudiantes? ¿Los estudiantes más jóvenes se adaptan más rápidamente que los mayores?

-- 8. Correlación entre la integración profesional y el uso de Internet:

¿Existe una correlación entre la integración en el entorno profesional (professional_bi) y el uso de Internet? ¿Los estudiantes más conectados profesionalmente tienden a usar más o menos Internet?

-- 9.  Influencia de la religión en el comportamiento social:

¿Qué influencia tiene la religiosidad (religion_bi) en el comportamiento social y la adaptación cultural de los estudiantes? ¿Existen diferencias significativas en la integración social entre estudiantes religiosos y no religiosos?

-- 10. Comparación entre estudiantes internacionales y domésticos:

¿Cuáles son las principales diferencias en el comportamiento, integración y preferencias entre estudiantes internacionales y domésticos (inter_dom)? ¿Qué variables destacan al comparar estos dos grupos?
