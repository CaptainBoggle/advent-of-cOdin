// AOC 2023 Day 1 - Trebuchet Part 1

package main

import "core:fmt"
import "core:os"
import "core:strings"
import "core:strconv"

main :: proc() {
    total := 0
    max_red, max_green, max_blue : int
    fields : []string

    iter := read_input()

    for line in strings.split_lines_iterator(&iter) {
        max_red, max_green, max_blue = 0, 0, 0
        fields = strings.fields((line[strings.index(line, ":")+1:]))
        for i := len(fields) - 1; i >= 0; i -= 2 {
            if strings.has_prefix(fields[i], "red") {
                max_red = max(strconv.atoi(fields[i-1]), max_red)
            } else if strings.has_prefix(fields[i], "green") {
                max_green = max(strconv.atoi(fields[i-1]), max_green)
            } else if strings.has_prefix(fields[i], "blue") {
                max_blue = max(strconv.atoi(fields[i-1]), max_blue)
            }
        }
        total += max_red * max_green * max_blue
    }

    fmt.printf("Total: %d\n", total)
}

read_input :: proc() -> string {
    FILE_NAME :: "input.txt"
    data, _ := os.read_entire_file(FILE_NAME)
    return string(data)
}