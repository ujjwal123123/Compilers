default: problem1

problem1: lab1.l
	flex --outfile lab1.c lab1.l
	gcc -o lab1 lab1.c -lfl
	rm lab1.c

run1: lab1
	./lab1

clean:
	rm lab1