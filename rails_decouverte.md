# Rails : vers la création de notre premier site web

Maintenant que nous avons des bases théoriques un peu plus complètes autour de Ruby, nous allons pouvoir créer notre premier site web avec Rails.

## Introduction

### La philosophie de Rails

Rails est un framework, ou "cadre de travail", i.e. un ensemble de ressources permettant de structurer un projet pour gagner en efficacité et en productivité.

Il a été créé par David Heinemeier Hansson (DHH pour les intimes), un des associés de 37signals, la société à l'origine du logiciel Basecamp.

Rails s'appuie sur la recherche de simplicité de Ruby, et repose sur deux concepts importants : "Don't Repeat Yourself", et "Convention over Configuration".

Ces deux concepts permettent aux développeurs d'écrire moins de code et de gagner en productivité et en sécurité, sous réserve de respecter un ensemble de conventions établies par des experts en ingénierie logicielle.

### MVC

Rails est un framework "MVC" pour Models / Views / Controllers.

Cette idée découpe le code de tout projet web en trois catégories :

- les **modèles** (Models) sont des éléments de code qui décrivent les données du projet, on peut les comparer aux différentes entités d'un refuge pour animaux (chiens, chats, humains...) ;
- les **vues** (Views) sont des éléménts de code qui décrivent les interfaces pour les utilisateurs du projet, on peut les comparer aux éléments visibles d'un refuge (salle de parade des animaux, vitrine...) ;
- les **contrôleurs** (Controllers) sont des éléments de code qui traitent les actions des utilisateurs et appellent les vues et les modèles nécessaires pour créer de la valeur et répondre à un usage, on peut les comparer aux actions possibles dans un refuge pour animaux (adopter, visiter...).

Dans un projet Rails, les contrôleurs doivent être les plus petits possibles au profit de modèles riches en actions, tandis que la quantité de code dans les vues dépend généralement de l'ergonomie du projet.

### De l'importance de la conception

Rails repose sur de nombreux éléments "pré-établis", tirés de conventions largement utilisées dans le monde à partir de l'expérience d'excellents développeurs.

Ces "bouts de code déjà présents" sont très pratiques à utiliser pour des développeurs débutants et évitent de nombreuses erreurs : ils donnent des fondations solides pour tout projet.

Si une seule chose devait être retenue de toute cette introduction, c'est qu'il ne faut jamais "chercher à réinventer la roue". En d'autres termes, Rails fournit déjà de nombreux modules qui permettent de réaliser tout projet basique (bien), et si vous cherchez à recoder ces modules par vous-même, vous risquez d'avoir des projets instables, durs à maintenir, et non-sécurisés (pas bien).

## Mise en place de l'environnement de travail

### Actions à faire sur le serveur du cours

Dans un premier temps, nous allons installer le module Rails pour Ruby et créer notre première application.

Pour cela :

1. Connectez-vous sur le serveur du cours à l'aide de ssh ;
2. Tapez ```gem install rails```
3. Attendez la fin de l'installation :)

La commande `gem install` sert à installer un module. Dans notre cas, nous installons le module Rails.

Vous pouvez ensuite créer votre première application "Ruby on Rails" avec la commande :

```rails new monappli```

### Actions à faire sur votre ordinateur

Dans un second temps, nous allons préparer notre machine pour qu'elle puisse dialoguer avec le serveur du cours.

Concrètement, le code du site web sera hébergé et édité directement sur le serveur du cours. Nous devons donc ajouter une extension à Atom pour permettre de travailler directement sur ce serveur.

1. Lancez Atom ;
2. Cliquez sur "View" puis sur "Toggle Command Palette" ;
3. Tapez "Install Packages And Themes" puis confirmez avec la touche "Entrée" ;
4. Tapez "ftp-remote-edit" dans le moteur de recherche, confirmez avec "Entrée" ;
5. Cliquez sur "Install" sur l'élément "SFTP-Deployment".

Une fois l'extension installée, nous devons configurer l'accès au serveur du cours.

1. Lancez Atom ;
2. Cliquez sur "View" puis sur "Toggle Command Palette" ;
3. Tapez "frees" (pour Ftp-Remote-Edit Edit Servers) et confirmez avec la touche "Entrée" ;
4. Une fenêtre apparaît pour vous demander un mot de passe, saisissez le mot de passe de votre choix sachant qu'il vous sera demandé à chaque session ;
5. Validez avec la touche "Entrée".

Un formulaire apparaît. Nous allons y ajouter le serveur du cours avec les instructions suivantes :

1. Cliquez sur "New" ;
2. Saisissez "vps451459.ovh.net" dans le champ "Name" ;
3. Saisissez "vps451459.ovh.net" dans le champ "Hostname" ;
4. Saisissez "22" dans le champ "Port" ;
5. Saisissez votre identifiant dans le champ "Username" ;
6. Saisissez votre mot de passe dans le champ "Password" ;
7. Cochez la case "Use sftp (ssh) connection" ;
8. Saisissez "/home/VOTRELOGIN" dans le champ "Initial directory", en remplaçant VOTRELOGIN par votre identifiant ;
9. Cliquez sur Save.

Toutes ces opérations (compliquées et obscures !) n'ont besoin d'être réalisées qu'une seule fois, pour la configuration d'Atom.

Les prochaines fois, nous pourrons directement exécuter les procédures de connexion au serveur de cours.

## Procédure de connexion au serveur de cours

Cette procédure suppose que vous ayez réalisé l'ENSEMBLE des actions de configuration ci-dessus.

1. Lancez Atom ;
2. Cliquez sur File, puis "Open Project Folder" ;
3. Choisissez le dossier de travail du cours sur votre machine ;
3. Tapez "fret" (pour Ftp-Remote-Edit Toggle) et confirmez avec la touche "Entrée" ;
4. Une fenêtre apparaît pour vous demander un mot de passe, saisissez le mot de passe choisi lors de la configuration ;
5. Validez avec la touche "Entrée" ;
6. Vérifiez qu'un panneau apparaît sur la droite de votre écran, avec "vps451459.ovh.net" ;
7. Cliquez sur le chevron ">" situé juste à gauche de "vps451459.ovh.net".

Les fichiers disponibles sur le serveur apparaissent. Vous pouvez alors les éditer en double-cliquant dessus : c'est comme Dropbox mais en mieux car vous pouvez coder dessus !

## Procédure de lancement de votre application

Cette procédure vous servira à transformer votre code en application web visible pour tout internaute. Il s'agit de lancer un "serveur" i.e. un processus qui "sert" vos fichiers et les interprète pour l'utilisateur.

1. Connectez-vous à la machine de cours ;
2. Allez dans votre application à l'aide de la commande ```cd DOSSIERDEVOTREAPPLICATION``` (cd pour Change Directory) ;
3. Tapez :
```
RAILS_ENV=development rails db:migrate ;
RAILS_ENV=development rails s -p 50XX -b 0.0.0.0
```

`RAILS_ENV` sert à définir l'environnement dans lequel nous voulons lancer l'application.

Par défaut, nous travaillerons sur l'environnement de développement. Seules les applications "abouties" seront lancées dans l'environnement dit de "production".

`rails db:migrate` sert à prendre en compte les dernières modifications réalisées sur les modèles, qui pourraient modifier la structure de la base de données.
Cette commande est nécessaire lorsque nous modifions les attributs de nos modèles.

`rails s -p 50XX -b 0.0.0.0` sert à lancer un serveur web (s pour server) sur le port 50XX et disponible pour tout internaute (0.0.0.0).

Vous pouvez alors consulter votre application à l'aide d'un navigateur web sur le lien : http://vps451459.ovh.net:50XX.