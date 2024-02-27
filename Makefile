CC = gcc

all: program

ifeq ($(mode),static)
	echo "static compilation"

else ifeq ($(mode),dynamic)
	echo "dynamic compilation"

else
program: object_file/main.o object_file/power.o object_file/factorial.o
	$(CC) object_file/main.o object_file/power.o object_file/factorial.o -o program 

object_file/main.o object_file/power.o object_file/factorial.o: src/main.c src/power.c src/factorial.c
	mkdir -p object_file
	$(CC) -c src/main.c -o object_file/main.o
	$(CC) -c src/power.c -o object_file/power.o
	$(CC) -c src/factorial.c -o object_file/factorial.o
endif

run:
	./program
	
clean:
	rm -rf object_file/ program
