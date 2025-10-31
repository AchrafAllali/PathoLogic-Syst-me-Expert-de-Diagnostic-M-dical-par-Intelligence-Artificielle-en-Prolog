%%
% Les maladies.

% Définition des règles pour déterminer la maladie en fonction des symptômes.

% Si les symptômes de la COVID-19 sont présents, alors l'hypothèse est "La COVID-19".
hypothese('La COVID-19') :- covid, !.

% Si les symptômes de la grippe sont présents, alors l'hypothèse est "La grippe".
hypothese('La grippe')   :- grippe, !.

% Si les symptômes de l'angine sont présents, alors l'hypothèse est "L'angine".
hypothese('L\'angine')   :- angine, !.

% Si les symptômes du rhume sont présents, alors l'hypothèse est "Le rhume".
hypothese('Le rhume')    :- rhume, !.

% Si les symptômes de la bronchite sont présents, alors l'hypothèse est "La bronchite".
hypothese('La bronchite') :- bronchite, !.

% Si les symptômes de l'asthme sont présents, alors l'hypothèse est "L'asthme".
hypothese('L\'asthme')   :- asthme, !.

% Si les symptômes de la sinusite sont présents, alors l'hypothèse est "La sinusite".
hypothese('La sinusite') :- sinusite, !.

% Si aucune maladie n'est détectée, alors l'hypothèse est "inconnue".
hypothese(inconnue) :-
    \+ covid, \+ grippe, \+ angine, \+ rhume, \+ bronchite, \+ asthme, \+ sinusite.

%%%%%%%%%%
% Les symptômes.

% Définition des symptômes pour la COVID-19.
covid :- fievre,
         toux,
         diarrhee,
         difficultes_respiratoires,
         fatigue,
         perte_odorat,
         perte_gout,
         congestion_nasale,
         mal_gorge,
         maux_tete,
         douleurs_musculaires.

covid :- fievre,
         toux,
         difficultes_respiratoires,
         fatigue,
         perte_odorat,
         perte_gout.

covid :- fievre,
         perte_odorat,
         perte_gout.

% Définition des symptômes pour la grippe.
grippe :- fievre,
          toux,
          congestion_nasale,
          mal_gorge,
          difficultes_respiratoires,
          maux_tete,
          douleurs_musculaires.

% Définition des symptômes pour l'angine.
angine :- fievre,
          mal_gorge,
          maux_tete,
          amygdales_rouge.

angine :- mal_gorge,
          maux_tete,
          amygdales_rouge.

% Définition des symptômes pour le rhume.
rhume :- fievre,
         congestion_nasale,
         mal_gorge.

rhume :- congestion_nasale,
         mal_gorge.

% Définition des symptômes pour la bronchite.
bronchite :- toux,
             difficultes_respiratoires,
             fievre, fatigue.

% Définition des symptômes pour l'asthme.
asthme :- difficultes_respiratoires,
          toux,
          oppression_thoracique.

% Définition des symptômes pour la sinusite.
sinusite :- congestion_nasale, 
            maux_tete, 
            douleurs_faciales.

%%
% Vérification des symptômes par l'utilisateur.

% Vérifier si l'utilisateur a de la fièvre.
fievre                    :- verifier('Est ce que vous avez une temperature superieure a 38 degre celsius?', img1).

% Vérifier si l'utilisateur a une toux.
toux                      :- verifier('Est ce que vous toussez?', img2).

% Vérifier si l'utilisateur a des difficultés respiratoires.
difficultes_respiratoires :- verifier('Avez vous des difficultes respiratoires?', img6).

% Vérifier si l'utilisateur est fatigué.
fatigue                   :- verifier('Est ce que vous etes fatigue?', img4).

% Vérifier si l'utilisateur a perdu l'odorat.
perte_odorat              :- verifier('Votre odorat est il perdu?', img9).

% Vérifier si l'utilisateur a perdu le goût.
perte_gout                :- verifier('Avez vous perdu le gout?', img10).

% Vérifier si l'utilisateur a une congestion nasale.
congestion_nasale         :- verifier('Est ce que vous avez une congestion nasale?', img11).

% Vérifier si l'utilisateur a mal à la gorge.
mal_gorge                 :- verifier('Avez vous du mal a la gorge?', img1).

% Vérifier si l'utilisateur a des maux de tête.
maux_tete                 :- verifier('Vous souffrez de maux de tete?', img3).

% Vérifier si l'utilisateur a eu de la diarrhée.
diarrhee                  :- verifier('Avez vous eu la diarrhee?', img5).

% Vérifier si l'utilisateur a des douleurs musculaires.
douleurs_musculaires      :- verifier('Vous souffrez de douleurs musculaires', img7).

% Vérifier si l'utilisateur a des amygdales rouges.
amygdales_rouge           :- verifier('Vous avez des amygdales rouges?', img8).

% Vérifier si l'utilisateur ressent une oppression thoracique.
oppression_thoracique     :- verifier('Ressentez-vous une oppression thoracique ?', img12).

% Vérifier si l'utilisateur a des douleurs faciales.
douleurs_faciales         :- verifier('Avez-vous des douleurs faciales ?', img13).