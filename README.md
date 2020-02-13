


<p align="center">
  <img src="https://storagecloudxx.blob.core.windows.net/5-stanislas/5_clouds.png" alt="Sublime's custom image"/>
</p>

# xCloud

XCloud a pour vocation de vous offrir une solution de stockage pour vos fichiers où que vous soyez.
Vous trouverez ci-dessous la documentation fonctionnelle et technique pour mettre en place et utiliser le projet.
Vous trouverez également un exemple de projet actuellement en ligne.

Adresse du site public : https://cloudxxappservice.azurewebsites.net/

La documentation du projet : https://docs.google.com/document/d/13qyA8Ne7cLA5rd7EzKQJ4Tlpopohpyc5uhkp7tCx0YM/edit?usp=sharing


### Déployer le projet :


1 : Cloner le projet depuis github : https://github.com/moxxxa/projet_cloud.git

2: Pour démarrer le projet en local. Il vous faudra installer NodeJs et Npm. Puis de démarrer les commandes suivantes :
npm i
node server.js || npm start

3 : Accédez au fichier variable tf de configuration terraform pour entrer vos propres identifiants Azure. Ajoutez ensuite la chaîne de connexion du compte de stockage dans le fichier “.env”, puis déployez les ressources à l'aide de Terraform.

4 : Facultatif : Vous pouvez configurer Jenkins présent sur votre environnement pour configurer le déploiement continue.

5 : Entrez ensuite dans le fichier config/db js les identifiants de connexion au serveur my Sql. Installez MysqlWorkbench puis connectez-vous à votre base de données.

6 : Vous pourrez ensuite accéder au projet en accédant l'URL de la ressource web app azure précédemment créé.

