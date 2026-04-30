export-env {
    $env.PROMPT_COMMAND = { ||
        let current_user = (^id -un | str trim)
        let host = (hostname | str trim)
        
        let is_root = ((^id -u | str trim) == "0")
        let user_color = (if $is_root { ansi red_bold } else { ansi cyan })
        let path_color = (ansi cyan_bold)
        
        let path = ($env.PWD | str replace $nu.home-path "~")

        $"\n($user_color)($current_user)(ansi reset)@($user_color)($host)(ansi reset) ($path_color)($path)(ansi reset)\n"
    }

    $env.PROMPT_COMMAND_RIGHT = { || "" }
}
