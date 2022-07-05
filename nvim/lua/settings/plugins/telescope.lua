require('telescope').setup{
    defaults = {
        file_ignore_patterns = {
            ".git/", 
            "node_modules/", 
            ".svelte-kit/", 
            "package/", 
            "build/"
        }
    }
}