bin/club: src/club.swift
	swiftc -lncurses src/club.swift -o bin/club

run: bin/club
	./bin/club
