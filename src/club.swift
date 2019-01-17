import Foundation
import Darwin.ncurses


struct Junk {
  var terminal_width: Int32 = 0
  var terminal_height: Int32 = 0
  var midpoint: Int32 = 0
}


let pipe_char: UInt32 = "|".unicodeScalars.map({ $0.value })[0]


func main() {
  var bucket = Junk()

  initscr()
  nodelay(stdscr, false)
  clear()
  refresh()

  bucket.terminal_width = getmaxx(stdscr)
  bucket.terminal_height = getmaxy(stdscr)
  bucket.midpoint = bucket.terminal_width / 2

  let left_win = newwin(bucket.terminal_height, bucket.midpoint - 1, 0, 0)
  waddstr(left_win, "Heyo")
  wrefresh(left_win)

  let right_win = newwin(bucket.terminal_height, bucket.midpoint - 1, 0, bucket.midpoint + 1)
  waddstr(right_win, "Righty!")
  wrefresh(right_win)

  move(0, bucket.midpoint)
  vline(pipe_char, bucket.terminal_height)


  refresh()

  getch()

  endwin()
}

main()
