# DouShouQi-SwiftGame

This project is a DouShouQi command line game coded in swift and usable in your terminal.
So far, only the board of the game is coded, the rest will follow soon.

To launch the project, open the `xcworkspace` file in XCode and run the project `DouShouQi_CLI`.

Here is Mr Chevaldonné' citerias table with a check of everything i did for this TP

## Commit for correction

To evaluate my work, you can base yourself on the last commit of the branch `tp2`

Commit hash : `06c5a8ed3117e008588de69fe6eb42bfe8660531`

## Project and Packages

Project `DouShouQi_CL` : The command line interface of the game

Package `Model`: Model of the application, containing structures, enumerations and tests

Package `ModelEmojiDisplayer`: Model extensions to improve the display of the board in CLI 


## Launch the project and the test

To be able to launch the project, you have to clone this repo and open it in XCode.

If you want to **launch the project and see the command line tests results**, you have to select `DouShouQi_CLI` and build the project.

The output is the DouShouQi board, presented as follow:
	```
		🌿🦁🟡		🌿  		🪤  		🪹  		🪤  		🌿  		🌿🐯🟡	
	
		🌿  		🌿🐶🟡		🌿  		🪤  		🌿  		🌿🐱🟡		🌿  	
	
		🌿🐭🟡		🌿  		🌿🐆🟡		🌿  		🌿🐺🟡		🌿  		🌿🐘🟡	
	
		🌿  		💧  		💧  		🌿  		💧  		💧  		🌿  	
	
		🌿  		💧  		💧  		🌿  		💧  		💧  		🌿  	
	
		🌿  		💧  		💧  		🌿  		💧  		💧  		🌿  	
	
		🌿  		💧  		💧  		🌿  		💧  		💧  		🌿  	
	
		🌿🐘🔴		🌿  		🌿🐺🔴		🌿  		🌿🐆🔴		🌿  		🌿🐭🔴	
	
		🌿  		🌿🐱🔴		🌿  		🪤  		🌿  		🌿🐶🔴		🌿  	
	
		🌿🐯🔴		🌿  		🪤  		🪹  		🪤  		🌿  		🌿🦁🔴	
	```

You can also see under the results of the command line tests on the new `countPieces` of a player `countPieces` of both the players, `insert` and `remove`methods.

Is you want to **launch the unit and performance tests**, select the package `Model` in the Scheme menu, edit the scheme to `Test` and run them. `Model` is 100% covered by the tests.

## Diagramm class

```mermaid
	classDiagram
	direction LR
	class Board {
	    <<struct>>
	    +nbRows : Int
	    +nbColumns : Int
	    +init?(withGrid:)
	    +countPieces(of:) Int
	    +countPieces() : (Int, Int)
	    +insert(piece:atRow:andColumn:) BoardResult
	    +removePiece(atRow:andColumn:) BoardResult
	}
	
	class BoardResult {
	  <<enum>>
	  unknown
	  ok
	  failed(reason:)
	}
	
	class BoardFailingReason {
	  <<enum>>
	  unknown
	  outOfBounds
	  cellNotEmpty
	  cellEmpty
	}
	
	Board ..> BoardResult
	BoardResult ..> BoardFailingReason
	
```

## Progress

So far, only the board of the game is implemented, the rest (rules, players, turn-by-turn game) will follow soon.
	
Here is Mr Chevaldonné' citerias table filled with my auto evaluation on everything I did for this TP, so that you can follow my progress.

niveau | description | status | coeff | pénalités TP3 | pénalités TP4  
--- | --- | --- | --- | --- | ---
☢️ | Le dépôt doit être accessible par l'enseignant | ✅ | ☢️ 
☢️ | un .gitignore doit exister au premier push | ✅| ☢️
🎬 | les *Packages* et le test compilent |✅ | 3 | 50% | 75%
🎬 | le test et les tests unitaires s'exécutent sans bug | ✅| 3 | 50% | 75%
1️⃣ | j'ai écrit ```countPieces(of:)``` | ✅| 2 | 50% | 75%
2️⃣ | j'ai utilisé des méthodes d'extension sur les collections |✅ | 3 | 50% | 75%
1️⃣ | j'ai écrit ```countPieces()``` |✅ | 2 | 50% | 75%
2️⃣ | j'ai utilisé un tuple nommé pour le retour |✅ | 2 | 50% | 75%
2️⃣ | j'ai testé ces fonctions en CLI |✅ | 1 | 50% | 75%
1️⃣ | j'ai créé l'enum ```BoardFailingReason``` | ✅| 1 | 50% | 75%
1️⃣ | j'ai créé l'enum ```BoardResult``` |✅ | 3 | 50% | 75%
1️⃣ | j'ai écrit ```insert(piece:atRow:andColumn:)``` |✅ | 2 | 50% | 75%
2️⃣ | j'ai testé cette fonction en CLI |✅ | 1 | 50% | 75%
1️⃣ | j'ai écrit ```removePiece(atRow:andColumn:)``` |✅ |2 | 50% | 75%
2️⃣ | j'ai testé cette fonction en CLI |✅ | 1 | 50% | 75%
1️⃣ | je sais utiliser ```guard``` | ✅| 2 | 50% | 75%
2️⃣ | je sais utiliser ```setUp``` ou ```setUpWithError``` |✅ | 4 | 50% | 75%
2️⃣ | je sais utiliser un jeu de données pour un test unitaire |✅ | 5 | 50% | 75%
2️⃣ | j'ai écrit les tests unitaires pour ```countPieces(of:)``` |✅ | 2 | 50% | 75%
2️⃣ | j'ai écrit les tests unitaires pour ```countPieces()``` | ✅| 2 | 50% | 75%
2️⃣ | j'ai écrit les tests unitaires pour ```insert(piece:atRow:andColumn:)``` |✅ | 2 | 50% | 75%
2️⃣ | j'ai écrit les tests unitaires pour ```removePiece(atRow:andColumn:)``` | ✅| 2 | 50% | 75
2️⃣ | j'ai écrit les tests unitaires pour l'initialiseur de ```Board``` |✅ | 2 | 50% | 75%
3️⃣ | ma couverture de tests pour *Model* dépasse les 50% |✅ | 2 | 50% | 75%
3️⃣ | ma couverture de tests pour *Model* dépasse les 70% | ✅| 3 | 50% | 75%
3️⃣ | ma couverture de tests pour *Model* dépasse les 85% |✅ | 3 | 50% | 75%
3️⃣ | j'ai écrit les tests de performance | ✅| 3 | 50% | 75%
3️⃣ | mon dépôt possède un readme qui apporte quelque chose... |✅ | 4 | 50% | 75%
3️⃣ | mon code est commenté |✅ | 1 | 50% | 75% 

Enjoy the game 🎉 (well, the grid at least).