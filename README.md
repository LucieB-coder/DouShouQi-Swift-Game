# DouShouQi-SwiftGame

This project is a DouShouQi command line game coded in swift and usable in your terminal.

To launch the project, open the `xcworkspace` file in XCode and run the project `DouShouQi_CLI`.

## Commit for correction

To evaluate my work, you can base yourself on the last commit of the branch `tp6`


## Project and Packages

Project `DouShouQi_CLI` : The command line interface of the game

Package `Model`: Model of the application, containing structures, enumerations and tests

Package `ModelEmojiDisplayer`: Model extensions to improve the display of the board in CLI 


## Launch the project and the test

To be able to launch the project, you have to clone this repo and open it in XCode.

If you want to **play a game**, you have to build the Model, then the EmojiDisplayer and finally select and start the project`DouShouQi_CLI`.

You will be able to create the players of the game between two kinds of Player, humanPlayer (you will manually type your moves) and randomPlayer (bot that is playing a random valid move) on a simplified board (the real board will come soon I hope).

If you want to **launch the unit and performance tests**, select the package `Model` and in the Scheme menu, edit the scheme to `Test` and run `Model`.


## Model class diagram

```mermaid
	classDiagram
	direction LR
	class Game {
		<<struct>>
		+board : Board
		+player1 : Player
		+player2 : Player
		+rules : Rules
		+init(Rules,Player,Player)
		+start()
	}

	Game ..> GameError

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

	class Rules {
		<<protocol>>
		+createBoard()$ Board
		+checkBoard(b: Board)$
		+getNextPlayer() Owner
		+getMoves(Board, Owner) Array~Move~
		+getMoves(Board, Owner, Int, Int) Array~Move~
		+isMoveValid(Board, Int, Int, Int, Int) Bool
		+isMoveValid(Board, Move) Bool
		+isGameOver(Board, Int, Int) : (Bool, Result)  
		+playedMove(Move, Board, Board)
		+occurences : [Board:Int]
		+historic: [Move]
	}
	Rules <|.. ClassicRules
	Rules <|.. VerySimpleRules
	
	class Move {
		<<struct>>
		+owner: Owner
		+rowOrigin: Int
		+columnOrigin: Int
		+rowDestination: Int
		+columnDestination: Int
	}
	
	class Result {
		<<enum>>
		notFinished
		even
		winner(Owner, WinningReason)
	}
	class WinningReason {
		<<enum>>
		unknown
		denReached
		noMorePieces
		tooManyOccurences
		noMovesLeft
	}
	Result ..> WinningReason
	Rules ..> Move
	Rules ..> Result
	Rules ..> Board
	
	class InvalidBoardError {
		<<enum>>
		badDimensions(Int, Int)
		badCellType(CellType,Int,Int)
		multipleOccurencesOfSamePiece(Piece)
		pieceWithNoOwner(Piece)
		pieceNotAllowedOnThisCell(Piece, Cell)
	}
	
	ClassicRules ..> InvalidBoardError
	VerySimpleRules ..> InvalidBoardError
	
	class GameError {
		<<enum>>
		invalidMove
	}
	
	ClassicRules ..> GameError
	VerySimpleRules ..> GameError
	
	class Player {
		+id: Owner
		+name: String
		+init?(withName: String, andId: Owner)
		+chooseMove(in: Board, with: Rules) Move?
	}
	
	class RandomPlayer {
		+init?(withName: String, andId: Owner)
		+chooseMove(in: Board, with: Rules) Move?
	}
	
	class HumanPlayer {
		+init?(withName: String, andId : Owner, andInputMethod: (HumanPlayer) -> Move)
		+input : (HumanPlayer) -> Move?
		+chooseMove(in: Board, with: Rules) Move?
	}
	
	RandomPlayer --|> Player
	HumanPlayer --|> Player
	
```


Enjoy the game 🎉.