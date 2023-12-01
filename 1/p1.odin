// AOC 2023 Day 1 - Trebuchet Part 1

package main

import "core:fmt"
import "core:os"
import "core:strings"

main :: proc() {
    iter := read_input()
    total := 0

    DIGITS :: "0123456789"
    for line in strings.split_lines_iterator(&iter) {
        digit_index := strings.index_any(line, DIGITS)
        total += 10 * (int(line[digit_index]) - '0')

        reversed := strings.reverse(line)
        digit_index = strings.index_any(reversed, DIGITS)
        total += int(reversed[digit_index]) - '0'
    }

    fmt.printf("Total: %d\n", total)
}

read_input :: proc() -> string {
    FILE_NAME :: "input.txt"
    data, _ := os.read_entire_file(FILE_NAME)
    return string(data)
}