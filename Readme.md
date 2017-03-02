To run the tictactoe server with docker

Go to tictactoe server
$ docker-compose build
It builds the images locally

Run the stack
$ docker stack deploy --compose-file docker-compose.yml tictactoe