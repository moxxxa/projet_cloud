# xCloud

XCloud a pour vocation de vous offrir une solution de stockage pour vos fichiers où que vous soyez.
Il s’agit de la documentation fonctionnel du site. Vous pouvez accédez à la documentation technique via notre repository github.

Adresse du site public : https://cloudxxappservice.azurewebsites.net/

Le documentation du projet : https://docs.google.com/document/d/13qyA8Ne7cLA5rd7EzKQJ4Tlpopohpyc5uhkp7tCx0YM/edit?usp=sharing


##### Déployer le projet :


1 : Cloner le projet depuis github : https://github.com/moxxxa/projet_cloud.git


2: Pour démarrer le projet en local. Il vous faudra installer NodeJs et Npm. Puis de démarrer les commandes suivante :
npm i
node server.js || npm start


3 : Accédez au fichier variable.tf de configuration terraform puis entrez vos propres identifiants Azure puis ajouter la chaîne de connexion du compte du stockage dans le fichier “.env”.


4 : Entrez ensuite dans le fichier config/db.js les identifiants de connexion au serveur mySql. Installez MysqlWorkbench puis connectez vous à votre base de donnée.


5 : Vous pourrez ensuite accéder au projet en accédant à votre
