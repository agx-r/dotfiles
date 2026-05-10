export-env {
    $env.PROMPT_COMMAND = { ||
        let last_exit = $env.LAST_EXIT_CODE
        
        let current_user = (^id -un | str trim)
        let host = (hostname | str trim)
        let is_root = ((^id -u | str trim) == "0")
        
        let user_color = (if $is_root { ansi red_bold } else { ansi cyan })
        let path_color = (ansi cyan_bold)
        let exit_color = (if $last_exit == 0 { ansi green } else { ansi red_bold })
        
        let path = ($env.PWD | str replace $nu.home-path "~")

        let prompt_base = $"($user_color)($current_user)(ansi reset)@($user_color)($host)(ansi reset) ($path_color)($path)(ansi reset)"
        let exit_status = $"($exit_color)[Exit: ($last_exit)](ansi reset)"

        $"\n($prompt_base) ($exit_status)\n"
    }

    $env.PROMPT_COMMAND_RIGHT = { || "" }
}
