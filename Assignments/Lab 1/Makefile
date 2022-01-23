default: problem1

problem1: problem1.l
	flex --outfile problem1.c problem1.l
	gcc -o problem1 problem1.c -lfl

problem2: problem2.l
	flex --outfile problem2.c problem2.l
	gcc -o problem2 problem2.c -lfl

clean:
	rm problem1.c problem1 problem2.c problem2