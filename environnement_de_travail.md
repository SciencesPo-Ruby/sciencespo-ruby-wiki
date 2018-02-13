# Mettre en place l'environnement de travail

Afin de faciliter les travaux de la classe, le cours repose sur un environnement de développement en ligne nommé Code Anywhere.

Ce logiciel en ligne permet de coder et d'exécuter du code sans installation complémentaire, que l'on utilise un ordinateur portable ou fixe, un ordinateur Windows / Linux / Mac, tournant sur 32 ou 64 bits...

Cette section montre comment préparer son environnement de travail sur Code Anywhere.

## 1) Accès

Code Anywhere est accessible sur l'URL https://www.codeanywhere.com.

## 2) Création de l'environnement de départ


### 2.1 Créer un projet

Après création d'un compte utilisateur, vous devrez créer un projet.

Un projet est un ensemble de fichiers (votre code), ainsi qu'un environnement d'exécution (ce qui lance votre code).

Lors de votre première connexion, une fenêtre "Create New Project" s'affiche. Choisissez un nom de projet et validez.

Pour créer un nouveau projet, vous pouvez aussi cliquer sur "File", puis "New Project". Choisissez alors un nom de projet, et validez.

### 2.2 Choisir un environnement d'exécution

Pour les besoins du cours, nous utiliserons un "container" avec Ruby et Ruby on Rails sur Ubuntu 14.04.

Si la curiosité vous pousse à chercher pourquoi prendre un container avec Ruby et Ruby on Rails sur Ubuntu 14.04 :
- un container est un "mini ordinateur" qui permet d'exécuter du code temporairement ou de faire tourner une application web, ce qui nous intéresse tout particulièrement ici ;
- Ruby, parce que c'est le langage de programmation que nous utilisons ici ;
- Ruby on Rails, parce que c'est la technologie qui permet de produire des sites web avec Ruby.

### 2.3 Voir l'ensemble de ses projets

Si vous souhaitez consulter l'ensemble de vos projets, cliquez-ici : https://codeanywhere.com/dashboard.

Vous pouvez aussi accéder à ce lien en cliquant sur l'icône de profil (en haut à droite de l'écran), puis sur Dashboard.

## 3) Coder sur Code Anywhere

### 3.1 La console de développement

La console de développement est un environnement interactif reposant sur le container Ruby on Rails Ubuntu 14.04 choisi précédemment, et qui permet d'exécuter des instructions informatiques.

Il s'agit globalement de donner des instructions à un "mini ordinateur en ligne", sauf qu'au lieu de cliquer, on saisit des lignes de commandes en texte.

C'est par ce biais que nous testerons du code, et que nous lancerons nos programmes ou nos sites internet.

La console de développement est accessible via la colonne de gauche, dans la catégorie "Connections". Faites un clic-droit sur votre container, puis "SSH-Terminal" pour lancer la console.

### 3.2 Les fichiers

Code Anywhere vous permet de créer ou de stocker des fichiers comme du texte, des images, des PDFs...

Pour créer votre premier fichier, cliquez sur "File" puis "New File".

Pour enregistrer votre fichier, cliquez sur "File" puis "Save".

Attention : en mode gratuit, il est possible de perdre des données avec Code Anywhere ! Pensez à télécharger vos fichiers de travail en fin de séance, en faisant "Clic-droit" sur le fichier, puis "Download".

### 3.3 Les dossiers

Code Anywhere permet également de créer un dossier.

Pour cela, faites "Clic-droit" sur le container, puis "Create folder".

Si vous faites "Clic-droit" puis "Download" sur un dossier, vous téléchargerez alors l'ensemble du dossier.

### 3.4 Exécuter un fichier

Via la console de développement, tapez "ruby NOMDUFICHIER" en remplaçant NOMDUFICHIER par le nom du fichier à exécuter.

Validez avec la touche "Entrée".

## 5) Mode de travail recommandé

Voici quelques règles de base qui permettront d'avoir une structure de travail "claire" pour bien débuter sur Ruby :

- un dossier de travail = une séance
- un fichier .rb = un fichier de code Ruby pour résoudre un exercice
- dans le code, nous éviterons les espaces inutiles
- l'indentation se fera à l'aide de deux espaces (touche Tab sur Code Anywhere)
- à la fin de chaque séance, téléchargez votre dossier de travail pour éviter toute perte de données !
