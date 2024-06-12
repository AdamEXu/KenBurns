# KenBurns

## Setup
Download this repository via [this link](https://github.com/AdamEXu/KenBurns/zipball/master/). Double click the downloaded zip file to unpack it into a folder. Inside of this folder, you will find two scripts.

Now, open a new terminal window. (Applications/Terminal). Navigate to the folder just unzipped. Run the following two commands:
`sudo gem install mini_magick`
`brew install imagemagick` (This requires the Homebrew command. If you do not already have Homebrew installed on your computer, install it from [here](https://github.com/Homebrew/brew/releases/download/4.3.5/Homebrew-4.3.5.pkg).)

## Running
1. Create a folder inside of the folder called "images".
2. Put all of your images inside of this new folder
3. Run the command `./resize.rb images`
4. Run the command `./slideshow.rb images output.mp4`
5. Open output.mp4

