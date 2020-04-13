import Darwin.ncurses


func main() {
    initscr()
    clear()
    
    noecho()
    curs_set(0)
    
    let scr_w = Int(getmaxx(stdscr))
    let scr_h = Int(getmaxy(stdscr))
    
    let message = "Join the club."
    let x = scr_w / 2 - message.count / 2
    let y = scr_h / 2
    move(Int32(y), Int32(x))
    addstr(message)
    refresh()
    
    getchar()
    endwin()
}


main()
