% Inclure un fichier externe 'testbf.pl' qui contient probablement des règles ou des faits supplémentaires.
:- include('testbf.pl').

% Charger la bibliothèque PCE pour créer des interfaces graphiques.
:- use_module(library(pce)).

% Définir le répertoire où les images sont stockées.
:- pce_image_directory('./images').

% Charger un module pour gérer les styles dans l interface graphique.
:- use_module(library(pce_style_item)).

% Definir encodage des caracteres.
:- encoding(iso_latin_1).

% Declarer que les predicats color/2 sont dynamiques (modifiables pendant l execution).
:- dynamic color/2.

% Definir des ressources (images) qui seront utilisees dans interface graphique.
resource(inter, image, image('acceuil.jpg')).
resource(img_principal, image, image('comed.jpg')).
resource(loading, image, image('reflexion.jpg')).
resource(out, image, image('resultat.jpg')).
resource('La COVID-19', image, image('conseils/covid.jpg')).
resource('La grippe', image, image('conseils/grippe1.jpg')).
resource('L\'angine', image, image('conseils/angine.jpg')).  % Correction ici
resource('Le rhume', image, image('conseils/rhume.jpg')).
resource('La bronchite', image, image('conseils/bronchite.jpg')).
resource('L\'asthme', image, image('conseils/asthme.jpg')).
resource('La sinusite', image, image('conseils/sinusite.jpg')).
resource(img1, image, image('symptomes/fievre.jpg')).
resource(img2, image, image('symptomes/toux.jpg')).
resource(img3, image, image('symptomes/maux_de_tete.jpg')).
resource(img4, image, image('symptomes/fatigue.jpg')).
resource(img5, image, image('symptomes/diarrhee.jpg')).
resource(img6, image, image('symptomes/difficultes_respiratoires.jpg')).
resource(img7, image, image('symptomes/douleurs_musculaires.jpg')).
resource(img8, image, image('symptomes/amygdales_rouges.jpg')).
resource(img9, image, image('symptomes/perte_odorat.jpg')).
resource(img10, image, image('symptomes/perte_gout.jpg')).
resource(img11, image, image('symptomes/congestion_nasale.jpg')).
resource(img12, image, image('symptomes/oppression_thoracique.jpg')).
resource(img13, image, image('symptomes/douleurs_faciales.jpg')).

% Afficher une image dans une fenêtre donnée.
affiche_image(Affichage, Image) :- new(Figure, figure),
                                   new(Bitmap, bitmap(resource(Image),@on)),
                                   send(Bitmap, name, 1),
                                   send(Figure, display, Bitmap),
                                   send(Figure, status, 1),
                                   send(Affichage, display,Figure,point(100,80)).

% Créer une nouvelle image dans une fenêtre donnée.
nouveau_image(Fenetre, Image) :- new(Figure, figure),
                                 new(Bitmap, bitmap(resource(Image),@on)),
                                 send(Bitmap, name, 1),
                                 send(Figure, display, Bitmap),
                                 send(Figure, status, 1),
                                 send(Fenetre, display,Figure,point(0,0)).

% Afficher une image associée à une question dans une fenêtre.
imagen_qst(Fenetre, Image) :- new(Figure, figure),
                              new(Bitmap, bitmap(resource(Image),@on)),
                              send(Bitmap, name, 1),
                              send(Figure, display, Bitmap),
                              send(Figure, status, 1),
                              send(Fenetre, display,Figure,point(500,60)).

% Gérer les boutons de la interface et afficher les résultats.
boutons :- free(@maladie),
           free(@quitter),
           free(@conseil),
           new(@quitter,button('Quitter',and(message(@main,destroy),message(@main,free)))),
           new(@maladie, label(nombre,'',font('georgia','roman',28))),
           effacer,
           send(@debut, free),
           hypothese(Maladie),
           nouveau_image(@main, loading),
           sleep(1.5),
           nouveau_image(@main, out),
           send(@main, display, @maladie, point(240,380)),
           send(@maladie, selection(Maladie)),
           new(@conseil, button('Conseils', message(@prolog, resultat, Maladie))),
           send(@main, display, @conseil, point(25, 620)),
           new(@debut, button('Recommencer', message(@prolog, boutons))),
           send(@main, display, @debut, point(290, 620)),
           send(@main, display, @quitter, point(390, 620)),
           annuler.

% Poser une question à le utilisateur et enregistrer la réponse.
demander(Symptome, Img) :- new(Di,dialog('Questions:')),
                           new(L2, label(texto, 'Repondez aux Questions')),
                           new(La, label(prob, Symptome)),
                           imagen_qst(Di, Img),
                           new(B1,button('OUI', and(message(Di, return, oui)))),
                           new(B2,button('NON', and(message(Di, return, non)))),
                           send(Di, gap, size(25, 25)),
                           send(Di, append(L2)),
                           send(Di, append(La)),
                           send(Di, append(B1)),
                           send(Di, append(B2)),
                           send(Di, default_button,'OUI'),
                           send(Di, open_centered), get(Di,confirm,Reponse),
                           ( (Reponse == oui) -> assert(yes(Symptome)) ; assert(no(Symptome)), free(Di),fail ),
                           free(Di).                 

% Afficher les conseils pour une maladie donnée.
resultat(Msg) :- new(@conseil_g, dialog('Conseils pour votre maladie')),
                nouveau_image(@conseil_g, Msg),
                send(@conseil_g, open_centered).

% Créer linterface principale de application.
interface_principal :- new(@main,dialog('CoMed: Consultation medicale')),
                       new(@quitter, button('QUITTER', and(message(@main,destroy), message(@main,free)))),
                       new(@debut, button('COMMENCER LE TEST', message(@prolog, boutons))),
                       nouveau_image(@main, img_principal),
                       send(@main, append(@debut)),
                       send(@main, append(@quitter)),
                       send(@main, open_centered).

% Créer interface initiale avec un bouton pour commencer et un pour quitter.
creer_interface :- new(@interface,dialog('CoMed: Consultation medicale')),
                   affiche_image(@interface, inter),
                   new(BoutonComencer, button('COMMENCER', and(message(@prolog, interface_principal) ,
                   and(message(@interface, destroy), message(@interface, free)) ))),
                   new(BoutonQuitter, button('QUITTER', and(message(@interface, destroy), message(@interface, free)))),
                   send(@interface, append(BoutonComencer)),
                   send(@interface, append(BoutonQuitter)),
                   send(@interface, open_centered).

% Démarrer application en créant interface initiale.

% Effacer la selection actuelle dans interface.
effacer :- send(@maladie, selection('')).

% Vérifier si un symptôme a été confirmé ou non.
verifier(Symptome, Img) :- ( yes(Symptome)) -> true ; (no(Symptome)) -> fail ; demander(Symptome, Img)) ).

% Déclarer que les prédicats yes/1 et no/1 sont dynamiques.
:- dynamic yes/1, no/1.

% Annuler toutes les réponses enregistrées (yes/1 et no/1).
annuler :- retract(yes(_)), fail.
annuler :- retract(no(_)), fail.
annuler.