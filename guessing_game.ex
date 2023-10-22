defmodule GuessingGame do  
    def compare(_secret_number,_guess \\ :no_guess)
    def compare(_secret_number, guess) when guess == :no_guess, do: "Make a guess"
    def compare(secret_number,guess) when secret_number == guess, do: "Correct"
    def compare(secret_number,guess) when guess == secret_number+1 or guess == secret_number-1, do: "So close"
    def compare(secret_number,guess) when secret_number < guess, do: "Too high"
    def compare(secret_number,guess) when secret_number > guess, do: "Too low"
end