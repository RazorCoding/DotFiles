use std::io::{self, Write};

#[derive(Copy, Clone, PartialEq)]
enum Player {
    X,
    O,
}

struct Game {
    board: [[Option<Player>; 3]; 3],
    current_player: Player,
}

impl Game {
    fn new() -> Self {
        Game {
            board: [[None; 3]; 3],
            current_player: Player::X,
        }
    }

    fn print_board(&self) {
        for row in &self.board {
            for cell in row {
                match cell {
                    Some(Player::X) => print!(" X "),
                    Some(Player::O) => print!(" O "),
                    None => print!(" . "),
                }
            }
            println!();
        }
        println!();
    }

    fn make_move(&mut self, row: usize, col: usize) -> Result<(), &'static str> {
        if row >= 3 || col >= 3 {
            return Err("Invalid move! Please enter a row and column between 0 and 2.");
        }

        if self.board[row][col].is_some() {
            return Err("Cell already taken! Choose another cell.");
        }

        self.board[row][col] = Some(self.current_player);
        Ok(())
    }

    fn switch_player(&mut self) {
        self.current_player = match self.current_player {
            Player::X => Player::O,
            Player::O => Player::X,
        };
    }

    fn check_winner(&self) -> Option<Player> {
        for i in 0..3 {
            if self.board[i][0].is_some() && self.board[i][0] == self.board[i][1] && self.board[i][1] == self.board[i][2] {
                return self.board[i][0];
            }
            if self.board[0][i].is_some() && self.board[0][i] == self.board[1][i] && self.board[1][i] == self.board[2][i] {
                return self.board[0][i];
            }
        }

        if self.board[0][0].is_some() && self.board[0][0] == self.board[1][1] && self.board[1][1] == self.board[2][2] {
            return self.board[0][0];
        }

        if self.board[0][2].is_some() && self.board[0][2] == self.board[1][1] && self.board[1][1] == self.board[2][0] {
            return self.board[0][2];
        }

        None
    }

    fn is_draw(&self) -> bool {
        self.board.iter().flatten().all(|&cell| cell.is_some())
    }
}

fn main() {
    let mut game = Game::new();

    loop {
        game.print_board();

        println!("Player {:?}, enter your move (row and column): ", game.current_player);
        let mut input = String::new();
        io::stdout().flush().unwrap();
        io::stdin().read_line(&mut input).expect("Failed to read input");

        let input: Vec<usize> = input
            .trim()
            .split_whitespace()
            .filter_map(|s| s.parse().ok())
            .collect();

        if input.len() != 2 {
            println!("Invalid input! Please enter two numbers separated by a space.");
            continue;
        }

        let (row, col) = (input[0], input[1]);

        match game.make_move(row, col) {
            Ok(_) => {
                if let Some(winner) = game.check_winner() {
                    game.print_board();
                    println!("Player {:?} wins!", winner);
                    break;
                } else if game.is_draw() {
                    game.print_board();
                    println!("It's a draw!");
                    break;
                } else {
                    game.switch_player();
                }
            }
            Err(err) => println!("{}", err),
        }
    }
}

