// AOC 2023 Day 2 - Cube Conundrum Part 1

package main

import "core:fmt"
import "core:os"
import "core:strings"

main :: proc() {
    iter := read_input()
    id, total := 0, 0
    illegal_strings := build_illegal_strings()
    for line in strings.split_lines_iterator(&iter) {
        id += 1
        illegal_idx, _ := strings.index_multi(line[strings.index(line, ":"):], illegal_strings)
        if illegal_idx == -1 {
            fmt.printf("ID: %d\n", id)
            total += id
        }
    }
    fmt.printf("Total: %d\n", total)
}

read_input :: proc() -> string {
    FILE_NAME :: "input.txt"
    data, _ := os.read_entire_file(FILE_NAME)
    return string(data)
}

// This is somehow nicer than just declaring the array to me ???
build_illegal_strings :: proc() -> []string {
    illegal_strings := make([]string, 88)
    for i in 15..=99 {
        illegal_strings[i-15] = fmt.tprintf("%d", i)
    }
    illegal_strings[85] = "13 red"
    illegal_strings[86] = "14 red"
    illegal_strings[87] = "14 green"
    fmt.printf("Illegal strings: %s\n", illegal_strings)
    return illegal_strings
}