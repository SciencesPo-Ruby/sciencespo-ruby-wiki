# Mettre en place l'environnement de travail

Afin de faciliter les travaux de la classe, le cours dipose d'un ordinateur hébergé chez OVH : il s'agit d'un serveur informatique.

Ce serveur permet d'avoir un environnement de travail identique pour tous les élèves, plutôt que de devoir gérer les nombreuses différences entre les ordinateurs portables / fixes, utilisant Windows / Linux / Mac, tournant sur 32 ou 64 bits...

Cette section montre comment connecter son ordinateur portable au serveur du cours.

## 1) Description du serveur

Le serveur est une machine sous Linux hébergée chez OVH.

Sa configuration est celle d'un VPS SSD 3 selon le lien : https://www.ovh.com/fr/vps/vps-ssd.xml

Cette machine fournit un bon compromis prix / performances, et permet d'avoir une machine Linux accessible depuis n'importe où.

Programmer un site web est beaucoup plus simple sous Linux : la mise en place de Ruby on Rails est triviale et les tests sont plus faciles à lancer. Cette machine Linux accessible depuis toute machine connectée à Internet fournit ainsi un bon terrain de jeu pour les travaux de ce cours.

## 2) Se connecter au serveur du cours

La communication entre machine passe par un protocole de transmission de l'information. Un tel protocole permet d'échanger des instructions avec une machine distante, ou de transférer des fichiers.

Dans le cadre de ce cours, nous utiliserons le protocole standard de communication avec une machine Linux : SSH (Secure SHell).

### 2.1) Se connecter au serveur depuis une machine Linux

1. Ouvrir une console Bash
2. Taper `ssh LOGIN@SERVEUR` en remplaçant "LOGIN" par votre identifiant et "SERVEUR" par l'adresse de la machine Linux du cours.
3. Confirmer avec la touche "Entrée".
4. Saisir votre mot de passe et confirmer avec la touche "Entrée". Attention : lors de la saisie du mot de passe, rien n'apparaîtra à l'écran par mesure de sécurité.

### 2.2) Se connecter au serveur depuis une machine Windows

1. Télécharger Putty sur : https://the.earth.li/~sgtatham/putty/latest/w64/putty.exe
2. Lancer Putty
3. Dans le champ "Hostname" / "IP address", saisir l'adresse de la machine Linux du cours.
4. Cliquer sur "Open"
5. Saisir votre identifiant et confirmer avec la touche "Entrée"
6. Saisir votre mot de passe et confirmer avec la touche "Entrée". Attention : lors de la saisie du mot de passe, rien n'apparaîtra à l'écran par mesure de sécurité.

### 2.3) Se connecter au serveur depuis une machine Mac

1. Afficher les applications à l'aide de la touche "F4".
2. Taper "Terminal" dans le moteur de recherche. Valider avec la touche "Entrée".
3. Taper `ssh LOGIN@SERVEUR` en remplaçant "LOGIN" par votre identifiant et "SERVEUR" par l'adresse de la machine Linux du cours.
4. Confirmer avec la touche "Entrée".
5. Saisir votre mot de passe et confirmer avec la touche "Entrée". Attention : lors de la saisie du mot de passe, rien n'apparaîtra à l'écran par mesure de sécurité.

## 3) Installer l'éditeur de code Atom et le connecter au serveur de cours

### 3.1) Installer l'éditeur de code Atom

1. Aller sur le site d'Atom https://atom.io/
2. Télécharger le logiciel
3. Installer le logiciel

### 3.2) Installer le kit de connexion au serveur de cours

1. Ouvrir Atom
2. Cliquer sur "View" puis sur "Toggle Command Palette"
3. Taper "Install Packages And Themes" puis confirmer avec la touche "Entrée"
4. Taper "SFTP-Deployment" dans le moteur de recherche, confirmer avec "Entrée"
5. Cliquer sur "Install" sur l'élément "SFTP-Deployment".

### 3.3) Configurer Atom pour se connecter au serveur de cours

1. Créer un dossier dédié au cours
2. Créer un fichier vide nommé "test.txt" dans ce dossier.
3. Ouvrir Atom
4. Cliquer sur "File" puis "Add Project Folder", et sélectionner le dossier dédié au cours
5. Cliquer sur "View" puis sur "Toggle Command Palette"
6. Taper "Sftp Deployment: MapToRemote" et confirmer avec la touche "Entrée".
7. Choisir l'option "SFTP". Un fichier nommé "deployment-config.json" apparaît.
8. Ouvrir le fichier "deployment-config.json" avec Atom en double-cliquant dessus.
9. Remplacer le contenu du champ "host" par l'adresse du serveur de cours
10. Remplacer le contenu du champ "username" par votre identifiant
11. Remplacer le contenu du champ "password" par votre mot de passe
12. Remplacer le contenu du champ "remotePath" par `/home/LOGIN` où LOGIN est votre identifiant
13. Mettre le champ "uploadOnSave" à true
14. Sauvegarder à l'aide de la combinaison de touches "CTRL+S" sur Windows/Linux, "CMD+S" sur Mac. Une icône de chargement apparaît et affiche "Upload success" en cas de succès de la configuration.
