bin/club: src/club.swift
	swiftc src/club.swift -o bin/club

run: bin/club
	./bin/club
