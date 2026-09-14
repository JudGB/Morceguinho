function double_click(_key, _time)
{
    static last_press = 0;
    static waiting_second = false;

    if (keyboard_check_pressed(_key))
    {
        var current = current_time;

        if (waiting_second && (current - last_press <= _time))
        {
            waiting_second = false;
            return true;
        }

        last_press = current;
        waiting_second = true;
    }

    return false;
}