# 🏥 PathoLogic - Système Expert de Diagnostic Médical

Un système expert de diagnostic médical développé en Prolog avec interface graphique interactive, utilisant l'intelligence artificielle pour identifier les maladies respiratoires courantes.

## 📋 Table des Matières

- [Vue d'ensemble](#vue-densemble)
- [Fonctionnalités](#fonctionnalités)
- [Maladies Diagnostiquées](#maladies-diagnostiquées)
- [Technologies Utilisées](#technologies-utilisées)
- [Prérequis](#prérequis)
- [Installation](#installation)
- [Utilisation](#utilisation)
- [Structure du Projet](#structure-du-projet)
- [Architecture](#architecture)
- [Captures d'écran](#captures-décran)
- [Contribuer](#contribuer)
- [Licence](#licence)
- [Auteur](#auteur)

## 🎯 Vue d'ensemble

PathoLogic est un système expert médical interactif qui utilise le moteur d'inférence Prolog pour diagnostiquer des maladies respiratoires en posant une série de questions au patient. Le système analyse les symptômes fournis et propose un diagnostic basé sur une base de connaissances médicale prédéfinie.

## ✨ Fonctionnalités

- 🖥️ **Interface graphique intuitive** avec images illustratives
- 🤔 **Questions interactives** guidant le diagnostic
- 📊 **Moteur d'inférence** utilisant le chaînage avant
- 💡 **Conseils médicaux** personnalisés selon la maladie détectée
- 🔄 **Option de recommencer** le diagnostic
- 📸 **Visualisation des symptômes** avec images associées
- 🎨 **Interface conviviale** développée avec PCE (XPCE)

## 🦠 Maladies Diagnostiquées

Le système peut identifier les pathologies suivantes :

1. **COVID-19**
2. **Grippe**
3. **Angine**
4. **Rhume**
5. **Bronchite**
6. **Asthme**
7. **Sinusite**

## 🔧 Technologies Utilisées

- **Langage** : Prolog (SWI-Prolog recommandé)
- **Interface Graphique** : XPCE (PCE Library)
- **Encodage** : ISO Latin-1
- **Système Expert** : Base de règles et faits

## 📦 Prérequis

- SWI-Prolog (version 7.0 ou supérieure)
- Bibliothèque XPCE (généralement incluse avec SWI-Prolog)
- Système d'exploitation : Windows, Linux ou macOS

## 🚀 Installation

1. **Cloner le dépôt**
```bash
git clone https://github.com/AchrafAllali/PathoLogic-Systeme-Expert-de-Diagnostic-Medical-par-Intelligence-Artificielle-en-Prolog.git
cd PathoLogic-Systeme-Expert-de-Diagnostic-Medical-par-Intelligence-Artificielle-en-Prolog
```

2. **Installer SWI-Prolog**
   - Windows : Télécharger depuis [swi-prolog.org](https://www.swi-prolog.org/Download.html)
   - Linux : `sudo apt-get install swi-prolog`
   - macOS : `brew install swi-prolog`

3. **Vérifier la structure des dossiers**
```
projet/
├── test.pl
├── testbf.pl
└── images/
    ├── acceuil.jpg
    ├── comed.jpg
    ├── reflexion.jpg
    ├── resultat.jpg
    ├── conseils/
    │   ├── covid.jpg
    │   ├── grippe1.jpg
    │   ├── angine.jpg
    │   ├── rhume.jpg
    │   ├── bronchite.jpg
    │   ├── asthme.jpg
    │   └── sinusite.jpg
    └── symptomes/
        ├── fievre.jpg
        ├── toux.jpg
        ├── maux_de_tete.jpg
        ├── fatigue.jpg
        ├── diarrhee.jpg
        ├── difficultes_respiratoires.jpg
        ├── douleurs_musculaires.jpg
        ├── amygdales_rouges.jpg
        ├── perte_odorat.jpg
        ├── perte_gout.jpg
        ├── congestion_nasale.jpg
        ├── oppression_thoracique.jpg
        └── douleurs_faciales.jpg
```

## 💻 Utilisation

1. **Lancer le programme**
```bash
swipl test.pl
```

2. **Démarrer l'interface**
```prolog
?- creer_interface.
```

3. **Suivre les étapes**
   - Cliquer sur "COMMENCER"
   - Cliquer sur "COMMENCER LE TEST"
   - Répondre aux questions par "OUI" ou "NON"
   - Consulter le diagnostic et les conseils

## 📁 Structure du Projet

### Fichiers principaux

- **`test.pl`** : Fichier principal contenant l'interface graphique et la logique d'interaction
- **`testbf.pl`** : Base de connaissances (faits et règles médicales)

### Composants clés

#### test.pl
- Gestion de l'interface graphique (XPCE)
- Affichage des images
- Gestion des dialogues et boutons
- Système de questions/réponses
- Prédicats dynamiques pour stocker les réponses

#### testbf.pl
- Règles de diagnostic (`hypothese/1`)
- Définitions des symptômes pour chaque maladie
- Prédicats de vérification des symptômes
- Base de connaissances médicale

## 🏗️ Architecture

### Moteur d'inférence
Le système utilise un **chaînage avant** :
1. Collecte des symptômes via l'interface
2. Application des règles de diagnostic
3. Déduction de la maladie probable
4. Présentation du résultat avec conseils

### Prédicats principaux

```prolog
% Interface
creer_interface/0          % Crée l'écran d'accueil
interface_principal/0      % Crée l'interface principale
boutons/0                  % Gère le diagnostic

% Diagnostic
hypothese/1               % Détermine la maladie
verifier/2                % Vérifie un symptôme
demander/2                % Pose une question

% Affichage
affiche_image/2           % Affiche une image
resultat/1                % Affiche les conseils
```

### Base de règles

Exemple pour COVID-19 :
```prolog
covid :- 
    fievre,
    perte_odorat,
    perte_gout.
```

## 📸 Captures d'écran

<img width="1190" height="672" alt="image" src="https://github.com/user-attachments/assets/6cd9a2ad-ffca-412b-b445-a860ecd82fee" />
<img width="1192" height="673" alt="image" src="https://github.com/user-attachments/assets/af744447-ba34-4398-841b-0d4303c6cdc4" />

<img width="1187" height="616" alt="image" src="https://github.com/user-attachments/assets/49a0a679-7c18-45f4-b53e-92ffb396f01d" />




## 🤝 Contribuer

Les contributions sont les bienvenues ! Pour contribuer :

1. Forkez le projet
2. Créez une branche (`git checkout -b feature/amelioration`)
3. Committez vos changements (`git commit -m 'Ajout de fonctionnalité'`)
4. Pushez vers la branche (`git push origin feature/amelioration`)
5. Ouvrez une Pull Request

### Idées d'améliorations

- Ajouter plus de maladies
- Implémenter un système de probabilités
- Créer une version web
- Ajouter une base de données pour historiser les diagnostics
- Intégration avec des API médicales
- Support multilingue

## ⚠️ Avertissement

Ce système est à **usage éducatif uniquement** et ne remplace en aucun cas une consultation médicale professionnelle. En cas de symptômes, consultez un médecin qualifié.

## 📄 Licence

Ce projet est sous licence MIT. Voir le fichier `LICENSE` pour plus de détails.

## 👨‍💻 Auteur

**Achraf Allali**

- GitHub : [@AchrafAllali](https://github.com/AchrafAllali)
- LinkedIn : https://www.linkedin.com/in/achraf-allali-9889a0321/
- Email : achrafallali2003@gmail.com

## ❤️ Remerciements

- Communauté SWI-Prolog
- Contributeurs du projet
- Ressources médicales de référence

---

⭐ Si ce projet vous a été utile, n'hésitez pas à lui donner une étoile !

**Développé avec ❤️ en Prolog**
