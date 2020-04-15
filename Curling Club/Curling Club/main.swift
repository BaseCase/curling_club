import Darwin.ncurses


func main() {
    initscr()
    clear()
    
    noecho()
    curs_set(0)
    
    let scr_w = getmaxx(stdscr)
    let scr_h = getmaxy(stdscr)
    
    let message = "Join the club."
    let x = Int(scr_w) / 2 - message.count / 2
    let y = Int(scr_h) / 2
    move(Int32(y), Int32(x))
    addstr(message)
    refresh()
    getchar()

    //
    // show list of Curling Club files we could use
    //
    clear()
    let files = get_json_files_in_directory()
    let files_window = newwin(scr_h, scr_w, 0, 0)

    // TODO: compiler doesn't like using the wprint functions for some reason. figure out why and work around it?
    for i in 0..<files.count {
        wmove(files_window, Int32(i), Int32(0))
        waddstr(files_window, files[i])
    }
    wrefresh(files_window)

    // TODO: NEXT UP! highlight selected line in files list and scroll up/down with keystrokes
    getchar()

    endwin()
}


// TODO: learn how to really look at the filesystem and list files here
func get_json_files_in_directory() -> [String] {
    return [
        "here's a filename",
        "another fake file",
        "let's have three for kicks",
    ]
}


main()
