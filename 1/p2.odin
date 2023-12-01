// AOC 2023 Day 1 - Trebuchet Part 2

package main

import "core:fmt"
import "core:os"
import "core:strings"

main :: proc() {
    iter := read_input_replace()
    total := 0

    DIGITS :: "0123456789"
    for line in strings.split_lines_iterator(&iter) {
        digit_index := strings.index_any(line, DIGITS)
        total += 10 * (int(line[digit_index]) - '0')

        digit_index = strings.last_index_any(line, DIGITS)
        total += int(line[digit_index]) - '0'
    }

    fmt.printf("Total: %d\n", total)
}

replacement := map[string]string{
    "one" = "o1e",
    "two" = "t2o",
    "three" = "t3e",
    "four" = "f4r",
    "five" = "f5e",
    "six" = "s6x",
    "seven" = "s7n",
    "eight" = "e8t",
    "nine" = "n9e",
}

read_input_replace :: proc() -> string {
    FILE_NAME :: "input.txt"
    raw, _ := os.read_entire_file(FILE_NAME)
    data := string(raw)
    for key, value in replacement {
        data, _ = strings.replace_all(data, key, value)
    }
    return data
}