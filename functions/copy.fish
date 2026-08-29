function copy --description 'Copy stdin or file to Wayland clipboard'
    if count $argv > /dev/null
        command cat -- $argv | wl-copy
    else
        wl-copy
    end
end
