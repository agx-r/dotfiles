export-env {
    let user = ($env.USER? | default $env.USERNAME? | default "unknown")
    let host = (hostname | str trim)

    $env.PROMPT_COMMAND = { ||
        let path_color = (ansi cyan_bold)
        let user_color = (ansi cyan)
        let host_color = (ansi cyan)
        
        let path = ($env.PWD | str replace $nu.home-path "~")

        $"\n($user_color)($user)(ansi reset)@($host_color)($host)(ansi reset) ($path_color)($path)(ansi reset)\n"
    }

    $env.PROMPT_COMMAND_RIGHT = { || "" }
}
