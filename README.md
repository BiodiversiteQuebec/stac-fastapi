<p align="center">
  <img src="https://github.com/radiantearth/stac-site/raw/master/images/logo/stac-030-long.png" width=400>
  <p align="center">API du catalogue STAC de IO pour Biodiversité Québec et GEO BON.</p>
</p>

Cette API utilise https://github.com/stac-utils/stac-fastapi et https://github.com/stac-utils/stac-fastapi-pgstac. 

et est situé sur coleo-api. 

---
Installation
---
Pour démarrer l'installation: 

````
docker compose -f docker-compose-io.yml build 
docker compose -f docker-compose-io.yml up
````
Il est possible que le up ne fonctionne pas la première fois. Ré-essayer. 

---
Transfert des données
---
Une sauvegarde des données est faite quotidiennement dans le dossier /backup avec le fichier dump.sql. Pour récupérer la base de données:

````
cat `catalogdb.sql | docker exec -i  stac-db psql -U stacuser -d catalogdb
````
Il peut être nécessaire d'effacer tout ce qu'il y a dans catalogdb avant de faire l'injection. 

---
Injection de données
---
La documentation concernant l'injection de données dans le catalogue STAC se trouve ici: https://github.com/ReseauBiodiversiteQuebec/io-data
À noter que par défaut, la configuration NGINX ne permet pas de DELETE sur l'API. Il faut donc présentement enlever cette restriction temporairement avant de faire des injections. 

